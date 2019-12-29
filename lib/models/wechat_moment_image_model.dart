import 'image_model.dart';

class WeChatMomentImageModel extends ImageModel {
  static const String ContentType = 'square';

  final String link;
  final String productId;
  final String productType;

  WeChatMomentImageModel({
    String id,
    String title,
    String strippedContent,
    String searchType,
    String host,
    String url,
    List<String> metatagKeywords,
    String metatagPublishDate,
    String photoPath,
    this.link,
    this.productId,
    this.productType,
  }) : super(
          id: id,
          title: title,
          strippedContent: strippedContent,
          searchType: searchType,
          host: host,
          url: url,
          metatagKeywords: metatagKeywords,
          metatagPublishDate: metatagPublishDate,
          photoPath: photoPath,
        );

  factory WeChatMomentImageModel.fromMap(Map<String, dynamic> map) {
    return WeChatMomentImageModel(
      id: map['id'],
      title: map['title'],
      strippedContent: map['strippedContent'],
      searchType: ContentType,
      host: map['host'],
      url: map['url'],
      metatagKeywords: map['metatag.keywords'].cast<String>(),
      metatagPublishDate: map['metatag.publishdate'],
      photoPath: map['photoPath'],
      link: map['link'],
      productId: map['productId'],
      productType: map['productType'],
    );
  }

  factory WeChatMomentImageModel.fromDbMap(Map<String, dynamic> map) {
    return WeChatMomentImageModel(
      id: map['Id'],
      title: map['Title'],
      strippedContent: map['StrippedContent'],
      searchType: ContentType,
      host: map['Host'],
      url: map['Url'],
      metatagKeywords: [map['Keywords']],
      metatagPublishDate: map['PublishDate'],
      photoPath: map['PhotoPath'],
      link: map['Link'],
      productId: map['ProductId'],
      productType: map['ProductType'],
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
        'metatag.publishdate': metatagPublishDate,
        'photoPath': photoPath,
        'link': link,
        'productId': productId,
        'productType': productType,
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
        'Link': link,
        'ProductId': productId,
        'ProductType': productType,
      };
}
