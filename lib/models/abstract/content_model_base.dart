import 'package:equatable/equatable.dart';

abstract class ContentModelBase extends Equatable {
  final String id;
  final String title;
  final String strippedContent;
  final String searchType;
  final String host;
  final String url;
  final List<String> metatagKeywords;

  ContentModelBase({
    this.id,
    this.title,
    this.strippedContent,
    this.searchType,
    this.host,
    this.url,
    this.metatagKeywords,
  });

  Map<String, dynamic> toMap();
  Map<String, dynamic> toDbMap();
}
