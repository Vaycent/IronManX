import 'image_model.dart';

class QrCodeImageModel extends ImageModel {
  static const String ContentType = 'qrcode';

  final String linkType;
  final String alignmentStyle;
  final String qrcodeProducts;

  QrCodeImageModel({
    String id,
    String title,
    String strippedContent,
    String searchType,
    String host,
    String url,
    List<String> metatagKeywords,
    String metatagPublishdate,
    String photoPath,
    this.linkType,
    this.alignmentStyle,
    this.qrcodeProducts,
  }) : super(
          id: id,
          title: title,
          strippedContent: strippedContent,
          searchType: searchType,
          host: host,
          url: url,
          metatagKeywords: metatagKeywords,
          photoPath: photoPath,
        );

  factory QrCodeImageModel.fromMap(Map<String, dynamic> map) {
    return QrCodeImageModel(
      id: map['id'],
      title: map['title'],
      strippedContent: map['strippedContent'],
      searchType: ContentType,
      host: map['host'],
      url: map['url'],
      metatagKeywords: map['metatag.keywords'].cast<String>(),
      metatagPublishdate: map['metatag.publishdate'],
      photoPath: map['photoPath'],
      linkType: map['linkType'],
      alignmentStyle: map['alignmentStyle'],
      qrcodeProducts: map['qrcodeProducts'],
    );
  }

  factory QrCodeImageModel.fromDbMap(Map<String, dynamic> map) {
    return QrCodeImageModel(
      id: map['Id'],
      title: map['Title'],
      strippedContent: map['StrippedContent'],
      searchType: ContentType,
      host: map['Host'],
      url: map['Url'],
      metatagKeywords: [map['Keywords']],
      metatagPublishdate: map['PublishDate'],
      photoPath: map['PhotoPath'],
      linkType: map['LinkType'],
      alignmentStyle: map['AlignmentStyle'],
      qrcodeProducts: map['QrCodeProducts'],
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
        'metatag.keywords': metatagKeywords,
        'metatag.publishdate': metatagPublishdate,
        'photoPath': photoPath,
        'linkType': linkType,
        'alignmentStyle': alignmentStyle,
        'qrcodeProducts': qrcodeProducts,
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
        'PublishDate': metatagPublishdate,
        'PhotoPath': photoPath,
        'LinkType': linkType,
        'AlignmentStyle': alignmentStyle,
        'QrCodeProducts': qrcodeProducts,
      };
}
