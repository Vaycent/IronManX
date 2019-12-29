import 'abstract/content_model_base.dart';

class ImageModel extends ContentModelBase {
  static const String ContentType = 'image';
  static const String TableName = 'Images';

  final String photoPath;

  ImageModel({
    String id,
    String title,
    String strippedContent,
    String searchType,
    String host,
    String url,
    List<String> metatagKeywords,
    String metatagPublishDate,
    this.photoPath,
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

  factory ImageModel.fromMap(Map<String, dynamic> map) {
    return ImageModel(
      id: map['id'],
      title: map['title'],
      strippedContent: map['strippedContent'],
      searchType: ContentType,
      host: map['host'],
      url: map['url'],
      metatagKeywords: map['metatag.keywords'].cast<String>(),
      metatagPublishDate: map['metatag.publishdate'],
      photoPath: map['photoPath'],
    );
  }

  factory ImageModel.fromDbMap(Map<String, dynamic> map) {
    return ImageModel(
      id: map['Id'],
      title: map['Title'],
      strippedContent: map['StrippedContent'],
      searchType: ContentType,
      host: map['Host'],
      url: map['Url'],
      metatagKeywords: [map['Keywords']],
      metatagPublishDate: map['PublishDate'],
      photoPath: map['PhotoPath'],
    );
  }

  @override
  List<Object> get props => [id];

  @override
  Map<String, dynamic> toMap() => {
        'id': id,
        'title': title,
        'strippedContent': strippedContent,
        'searchType': searchType,
        'host': host,
        'url': url,
        'metatag.keywords': metatagKeywords,
        'metatag.publishdate': metatagPublishDate,
        'photoPath': photoPath,
      };

  @override
  Map<String, dynamic> toDbMap() => {
        'Id': id,
        'Title': title,
        'StrippedContent': strippedContent,
        'SearchType': searchType,
        'Host': host,
        'Url': url,
        'Keywords': keywords,
        'PublishDate': metatagPublishDate,
        'PhotoPath': photoPath,
      };
}
