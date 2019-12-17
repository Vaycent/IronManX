import 'abstract/content_model_base.dart';

class ArticleModel extends ContentModelBase {
  static const String ContentType = 'article';
  static const String TableName = 'Articles';

  // final String metatagSearchtitle;
  final String description;
  final String metatagThumbnail;
  final String contentTag;
  final int aboReadOnly;
  final int allowShare;
  final List<String> metatagAllowidentities;

  ArticleModel({
    String id,
    String title,
    String strippedContent,
    String searchType,
    String host,
    String url,
    List<String> metatagKeywords,
    String metatagPublishDate,
    // this.metatagSearchtitle,
    this.description,
    this.metatagThumbnail,
    this.contentTag,
    this.aboReadOnly,
    this.allowShare,
    this.metatagAllowidentities,
  }) : super(
          id: id,
          title: title,
          strippedContent: strippedContent,
          searchType: searchType,
          host: host,
          url: url,
          metatagKeywords: metatagKeywords,
          metatagPublishDate: metatagPublishDate,
        );

  @override
  List<Object> get props => [id];

  factory ArticleModel.fromMap(Map<String, dynamic> map) {
    return ArticleModel(
      id: map['id'],
      title: map['metatag.searchtitle'] ?? map['title'],
      strippedContent: map['strippedContent'],
      searchType: ContentType,
      host: map['host'],
      url: map['url'],
      // metatagSearchtitle: map['metatag.searchtitle'],
      description: map['description'],
      metatagThumbnail: map['metatag.thumbnail'],
      metatagKeywords: map['metatag.keywords'].cast<String>(),
      contentTag: map['contentTag'],
      aboReadOnly: map['aboReadOnly'],
      allowShare: map['allowShare'],
      metatagAllowidentities: map['metatag.allowidentities']?.cast<String>(),
      metatagPublishDate: map['metatag.publishdate'],
    );
  }

  factory ArticleModel.fromDbMap(Map<String, dynamic> map) {
    return ArticleModel(
      id: map['Id'],
      title: map['Title'],
      strippedContent: map['StrippedContent'],
      searchType: ContentType,
      host: map['Host'],
      url: map['Url'],
      description: map['Description'],
      metatagThumbnail: map['Thumbnail'],
      metatagKeywords: [map['Keywords']],
      contentTag: map['ContentTag'],
      aboReadOnly: map['AboReadOnly'],
      allowShare: map['AllowShare'],
      metatagAllowidentities: [map['AllowIdentities']],
      metatagPublishDate: map['PublishDate'],
    );
  }

  @override
  Map<String, dynamic> toMap() => {
        'id': id,
        'title': title,
        'strippedContent': strippedContent,
        'searchType': searchType,
        'host': host,
        'url': url,
        'description': description,
        'metatag.thumbnail': metatagThumbnail,
        'metatag.keywords': metatagKeywords,
        'contentTag': contentTag,
        'aboReadOnly': aboReadOnly,
        'allowShare': allowShare,
        'metatag.allowidentities': metatagAllowidentities,
        'metatag.publishdate': metatagPublishDate,
      };

  @override
  Map<String, dynamic> toDbMap() => {
        'Id': id,
        'Title': title,
        'StrippedContent': strippedContent,
        'SearchType': searchType,
        'Host': host,
        'Url': url,
        'Description': description,
        'Thumbnail': metatagThumbnail,
        'Keywords': keywords,
        'ContentTag': contentTag,
        'AboReadOnly': aboReadOnly,
        'AllowShare': allowShare,
        'AllowIdentities': allowIdentities,
        'PublishDate': metatagPublishDate,
      };

  String get allowIdentities => metatagAllowidentities != null && metatagAllowidentities.isNotEmpty ? metatagAllowidentities.first : null;
}
