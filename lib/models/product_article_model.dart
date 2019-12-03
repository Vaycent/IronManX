import 'article_model.dart';

class ProductArticleModel extends ArticleModel {
  static const String ContentType = 'product';

  ProductArticleModel({
    id,
    title,
    strippedContent,
    searchType,
    host,
    url,
    metatagKeywords,
    description,
    metatagThumbnail,
    contentTag,
    aboReadOnly,
    allowShare,
    metatagAllowidentities,
    metatagPublishdate,
  }) : super(
          id: id,
          title: title,
          strippedContent: strippedContent,
          searchType: searchType,
          host: host,
          url: url,
          metatagKeywords: metatagKeywords,
          description: description,
          metatagThumbnail: metatagThumbnail,
          contentTag: contentTag,
          aboReadOnly: aboReadOnly,
          allowShare: allowShare,
          metatagAllowidentities: metatagAllowidentities,
          metatagPublishdate: metatagPublishdate,
        );

  @override
  List<Object> get props => [id];

  factory ProductArticleModel.fromMap(Map<String, dynamic> map) {
    return ProductArticleModel(
      id: map['id'],
      title: map['metatag.searchtitle'] ?? map['title'],
      strippedContent: map['strippedContent'],
      searchType: ContentType,
      host: map['host'],
      url: map['url'],
      description: map['description'],
      metatagThumbnail: map['productImageUrl'],
      metatagKeywords: map['metatag.keywords'].cast<String>(),
      contentTag: map['contentTag'],
      aboReadOnly: map['aboReadOnly'],
      allowShare: map['allowShare'],
      metatagAllowidentities: map['metatag.allowidentities']?.cast<String>(),
      metatagPublishdate: map['metatag.publishdate'],
    );
  }

  factory ProductArticleModel.fromDbMap(Map<String, dynamic> map) {
    return ProductArticleModel(
      id: map['Id'],
      title: map['Title'],
      strippedContent: map['StrippedContent'],
      searchType: ContentType,
      host: map['Host'],
      url: map['Url'],
      description: map['Description'],
      metatagThumbnail: map['Thumbnail'],
      metatagKeywords: map['Keywords'].cast<String>(),
      contentTag: map['ContentTag'],
      aboReadOnly: map['AboReadOnly'],
      allowShare: map['AllowShare'],
      metatagAllowidentities: map['Allowidentities']?.cast<String>(),
      metatagPublishdate: map['Publishdate'],
    );
  }
}
