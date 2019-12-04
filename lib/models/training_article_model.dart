import 'article_model.dart';

class TrainingArticleModel extends ArticleModel {
  static const String ContentType = 'training';

  TrainingArticleModel({
    String id,
    String title,
    String strippedContent,
    String searchType,
    String host,
    String url,
    List<String> metatagKeywords,
    String description,
    String metatagThumbnail,
    String contentTag,
    int aboReadOnly,
    int allowShare,
    List<String> metatagAllowidentities,
    String metatagPublishdate,
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

  factory TrainingArticleModel.fromMap(Map<String, dynamic> map) {
    return TrainingArticleModel(
      id: map['id'],
      title: map['metatag.searchtitle'] ?? map['title'],
      strippedContent: map['strippedContent'],
      searchType: ContentType,
      host: map['host'],
      url: map['url'],
      description: map['description'],
      metatagThumbnail: map['metatag.thumbnail'],
      metatagKeywords: map['metatag.keywords'].cast<String>(),
      contentTag: map['contentTag'],
      aboReadOnly: map['aboReadOnly'],
      allowShare: map['allowShare'],
      metatagAllowidentities: map['metatag.allowidentities']?.cast<String>(),
      metatagPublishdate: map['metatag.publishdate'],
    );
  }

  factory TrainingArticleModel.fromDbMap(Map<String, dynamic> map) {
    return TrainingArticleModel(
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
      metatagAllowidentities: [map['Allowidentities']],
      metatagPublishdate: map['PublishDate'],
    );
  }
}
