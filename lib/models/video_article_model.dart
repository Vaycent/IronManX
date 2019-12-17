import 'article_model.dart';

class VideoArticleModel extends ArticleModel {
  static const String ContentType = 'video';

  final List<String> videoPoster;
  final List<String> videoPath;
  final int videolength;

  VideoArticleModel({
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
    String metatagPublishDate,
    this.videoPoster,
    this.videoPath,
    this.videolength,
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
          metatagPublishDate: metatagPublishDate,
        );

  factory VideoArticleModel.fromMap(Map<String, dynamic> map) {
    return VideoArticleModel(
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
      metatagPublishDate: map['metatag.publishdate'],
      videoPoster: map['videoPoster']?.cast<String>(),
      videoPath: map['videoPath']?.cast<String>(),
      videolength: map['videoLen'],
    );
  }

  factory VideoArticleModel.fromDbMap(Map<String, dynamic> map) {
    return VideoArticleModel(
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
      videoPoster: [map['VideoPoster']],
      videoPath: [map['VideoPath']],
      videolength: map['VideoLength'],
    );
  }

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
        'Allowidentities': allowIdentities,
        'PublishDate': metatagPublishDate,
        'VideoPoster': videoPosters,
        'VideoPath': videoPaths,
        'Videolength': videolength,
      };

  String get videoPaths => videoPath != null && videoPath.isNotEmpty ? videoPath.first : null;
  String get videoPosters => videoPoster != null && videoPoster.isNotEmpty ? videoPoster.first : null;
}
