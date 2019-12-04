import '../models/article_model.dart';
import '../models/product_article_model.dart';
import '../models/promotion_article_model.dart';
import '../models/training_article_model.dart';
import '../models/video_article_model.dart';
import '../providers/solr_data_provider.dart';
import '../providers/solr_query_parameters.dart';
import '../providers/sqlite_data_provider.dart';

class ContentRepository {
  static const ArticleQueryfiledList =
      'id,host,url,title,metatag.searchtitle,description,aboReadOnly,metatag.keywords,metatag.thumbnail,metatag.allowidentities,allowShare,promotion,contentTag,metatag.publishdate,productImageUrl,strippedContent,videoPoster,videoPath,videoLen';

  SolrDataProvider _dataProvider = SolrDataProvider(endPoint: 'https://search.amwaynet.com.cn', core: 'amway_cloud_fulltext');
  SqliteDataProvider _sqliteDataProvider = SqliteDataProvider();

  Future<String> maxValue(String field) async {
    final db = await _sqliteDataProvider.database;
    return firstStringValue(await db.rawQuery('SELECT max($field) FROM ${ArticleModel.TableName}'));
  }

  String firstStringValue(List<Map<String, dynamic>> list) {
    if (list != null && list.isNotEmpty) {
      final Map<String, dynamic> firstRow = list.first;
      if (firstRow.isNotEmpty) {
        return (firstRow.values?.first).toString();
      }
    }
    return null;
  }

  saveAllArticleContentToDatabase(List<ArticleModel> articles) async {
    final db = await _sqliteDataProvider.database;
    await db.transaction((txn) async {
      var batch = txn.batch();
      batch.delete(ArticleModel.TableName);
      articles.forEach((m) => batch.insert(ArticleModel.TableName, m.toDbMap()));
      await batch.commit(noResult: true);
    });
  }

  Future<List<ArticleModel>> getAllArticleContentFromSolr() async {
    var parameters = SolrQueryParameters(
      sort: 'metatag.publishdate desc',
      rows: 1,
      filterQuery: '((metatag.thumbnail:* || productImageUrl:*) && -noSearch:1)',
    );

    final numberFound = await _dataProvider.SearchNumberFound(parameters);

    if (numberFound > 0) {
      parameters.filedList = ArticleQueryfiledList;
      parameters.rows = numberFound;
      final response = await _dataProvider.Search(parameters);

      if (response.responseHeader?.status == 0 && response.response?.docs != null && response.response.docs.length > 0) {
        return response.response.docs.map((m) => _createArticleContentModel(m)).toList();
      }
    }

    return null;
  }

  Future<List<ArticleModel>> getUpdateArticleContentFromSolr(String from) async {
    var parameters = SolrQueryParameters(
      sort: 'metatag.publishdate desc',
      rows: 1,
      filterQuery: '((metatag.thumbnail:* || productImageUrl:*) && -noSearch:1 && metatag.publishdate:[$from TO *])',
    );

    final numberFound = await _dataProvider.SearchNumberFound(parameters);

    if (numberFound > 0) {
      parameters.filedList = ArticleQueryfiledList;
      parameters.rows = numberFound;
      final response = await _dataProvider.Search(parameters);

      if (response.responseHeader?.status == 0 && response.response?.docs != null && response.response.docs.length > 0) {
        return response.response.docs.map((m) => _createArticleContentModel(m)).toList();
      }
    }

    return null;
  }

  ArticleModel _createArticleContentModel(Map<String, dynamic> map) {
    if (map['promotion']?.toInt() == 1) {
      // promotion
      return PromotionArticleModel.fromMap(map);
    } else if (map['videoPath'] != null) {
      // video
      return VideoArticleModel.fromMap(map);
    } else if (map['url'].toString().contains('/training/cloud-school/')) {
      // training
      return TrainingArticleModel.fromMap(map);
    } else if (map['url'].toString().contains('/mobile/clientpages/productdetail.')) {
      // product
      return ProductArticleModel.fromMap(map);
    } else {
      // article
      return ArticleModel.fromMap(map);
    }
  }
}
