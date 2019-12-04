import 'solr_response.dart';
import 'solr_response_header.dart';

class SolrResult {
  final SolrResponseHeader responseHeader;
  final SolrResponse response;

  SolrResult({
    this.responseHeader,
    this.response,
  });

  factory SolrResult.fromMap(Map<String, dynamic> map) => SolrResult(
        responseHeader: SolrResponseHeader.fromMap(map['responseHeader']),
        response: SolrResponse.fromMap(map['response']),
      );
}
