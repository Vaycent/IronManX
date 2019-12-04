import '../models/qr_code_image_model.dart';
import '../models/wechat_moment_image_model.dart';

import '../models/image_model.dart';

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
  static const ImageQueryfiledList =
      'id,host,url,title,metatag.keywords,metatag.publishdate,strippedContent,photoPath,link,productId,productType,linkType,alignmentStyle,qrcodeProducts,photoType';

  SolrDataProvider _articleDataProvider = SolrDataProvider(endPoint: 'https://search.amwaynet.com.cn', core: 'amway_cloud_fulltext');
  SolrDataProvider _imageDataProvider = SolrDataProvider(endPoint: 'https://search.amwaynet.com.cn', core: 'amway_cloud_image');
  SqliteDataProvider _sqliteDataProvider = SqliteDataProvider();

  Future<String> maxValue(String table, String field) async {
    final db = await _sqliteDataProvider.database;
    return firstStringValue(await db.rawQuery('SELECT max($field) FROM $table'));
  }

  String firstStringValue(List<Map<String, dynamic>> list) {
    if (list != null && list.isNotEmpty) {
      final Map<String, dynamic> firstRow = list.first;
      if (firstRow.isNotEmpty) {
        return firstRow.values?.first;
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

  saveAllImageContentToDatabase(List<ImageModel> images) async {
    final db = await _sqliteDataProvider.database;
    await db.transaction((txn) async {
      var batch = txn.batch();
      batch.delete(ImageModel.TableName);
      images.forEach((m) => batch.insert(ImageModel.TableName, m.toDbMap()));
      await batch.commit(noResult: true);
    });
  }

  Future<List<ArticleModel>> getAllArticleContentFromSolr() async {
    var parameters = SolrQueryParameters(
      sort: 'metatag.publishdate desc',
      rows: 1,
      filterQuery: '((metatag.thumbnail:* || productImageUrl:*) && -noSearch:1)',
    );

    final numberFound = await _articleDataProvider.SearchNumberFound(parameters);

    if (numberFound > 0) {
      parameters.filedList = ArticleQueryfiledList;
      parameters.rows = numberFound;
      final response = await _articleDataProvider.Search(parameters);

      if (response.responseHeader?.status == 0 && response.response?.docs != null && response.response.docs.length > 0) {
        return response.response.docs.map((m) => _createArticleContentModel(m)).toList();
      }
    }

    return null;
  }

  Future<List<ImageModel>> getAllImageContentFromSolr() async {
    var parameters = SolrQueryParameters(
      sort: 'metatag.publishdate desc',
      rows: 1,
      // filterQuery: '((metatag.thumbnail:* || productImageUrl:*) && -noSearch:1)',
    );

    final numberFound = await _imageDataProvider.SearchNumberFound(parameters);

    if (numberFound > 0) {
      parameters.filedList = ImageQueryfiledList;
      parameters.rows = numberFound;
      final response = await _imageDataProvider.Search(parameters);

      if (response.responseHeader?.status == 0 && response.response?.docs != null && response.response.docs.length > 0) {
        return response.response.docs.map((m) => _createImageContentModel(m)).toList();
      }
    }

    return null;
  }

  Future<List<ImageModel>> getUpdateImageContentFromSolr(String from) async {
    var parameters = SolrQueryParameters(
      sort: 'metatag.publishdate desc',
      rows: 1,
      filterQuery: 'metatag.publishdate:[$from TO *]',
    );

    final numberFound = await _imageDataProvider.SearchNumberFound(parameters);

    if (numberFound > 0) {
      parameters.filedList = ImageQueryfiledList;
      parameters.rows = numberFound;
      final response = await _imageDataProvider.Search(parameters);

      if (response.responseHeader?.status == 0 && response.response?.docs != null && response.response.docs.length > 0) {
        return response.response.docs.map((m) => _createImageContentModel(m)).toList();
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

    final numberFound = await _articleDataProvider.SearchNumberFound(parameters);

    if (numberFound > 0) {
      parameters.filedList = ArticleQueryfiledList;
      parameters.rows = numberFound;
      final response = await _articleDataProvider.Search(parameters);

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

  ImageModel _createImageContentModel(Map<String, dynamic> map) {
    final photoType = map['photoType']?.toString();

    if (photoType != null) {
      if (photoType.compareTo('squareMng') == 0) {
        // square
        return WeChatMomentImageModel.fromMap(map);
      } else if (photoType.compareTo('QRCodeImg') == 0) {
        // QR code
        return QrCodeImageModel.fromMap(map);
      }
    }

    return ImageModel.fromMap(map);
  }
}
