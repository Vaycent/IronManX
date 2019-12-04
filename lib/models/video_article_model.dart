import 'article_model.dart';

class VideoArticleModel extends ArticleModel {
  static const String ContentType = 'video';

  final List<String> videoPoster;
  final List<String> videoPath;
  final int videolength;

  VideoArticleModel({
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
          metatagPublishdate: metatagPublishdate,
        );

  @override
  List<Object> get props => [id];

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
      metatagPublishdate: map['metatag.publishdate'],
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
      metatagKeywords: map['Keywords'].cast<String>(),
      contentTag: map['ContentTag'],
      aboReadOnly: map['AboReadOnly'],
      allowShare: map['AllowShare'],
      metatagAllowidentities: map['Allowidentities']?.cast<String>(),
      metatagPublishdate: map['Publishdate'],
      videoPoster: map['videoPoster']?.cast<String>(),
      videoPath: map['videoPath']?.cast<String>(),
      videolength: map['videoLen'],
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
        'Keywords': metatagKeywords.toString(),
        'ContentTag': contentTag,
        'AboReadOnly': aboReadOnly,
        'AllowShare': allowShare,
        'Allowidentities': metatagAllowidentities,
        'Publishdate': metatagPublishdate,
        'VideoPoster': videoPoster,
        'VideoPath': videoPath,
        'Videolength': videolength,
      };
}
