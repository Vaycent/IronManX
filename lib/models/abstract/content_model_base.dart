import 'package:equatable/equatable.dart';

abstract class ContentModelBase extends Equatable {
  final String id;
  final String title;
  final String strippedContent;
  final String searchType;
  final String host;
  final String url;
  final List<String> metatagKeywords;
  final String metatagPublishdate;

  ContentModelBase({
    this.id,
    this.title,
    this.strippedContent,
    this.searchType,
    this.host,
    this.url,
    this.metatagKeywords,
    this.metatagPublishdate,
  });

  List<String> splitToList(String source) => source != null ? source.split(',') : null;

  String get keywords => metatagKeywords != null && metatagKeywords.isNotEmpty ? metatagKeywords.first : null;

  Map<String, dynamic> toMap();
  Map<String, dynamic> toDbMap();
}
