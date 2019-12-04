// https://lucene.apache.org/solr/guide/6_6/common-query-parameters.html#CommonQueryParameters-TherowsParameter
// https://lucene.apache.org/solr/guide/6_6/the-standard-query-parser.html

import 'package:dio/dio.dart';

import '../models/solr/solr_result.dart';
import 'solr_data_response.dart';
import 'solr_query_parameters.dart';

class SolrDataProvider {
  final String endPoint;
  final String core;

  Dio restClient;

  SolrDataProvider({this.endPoint, this.core}) : assert(endPoint != null && core != null) {
    restClient = Dio(BaseOptions(
      baseUrl: '$endPoint/solr/$core',
      connectTimeout: 60000, // TODO: update this
      receiveTimeout: 60000, // TODO: update this
    ));
  }

  Future<SolrResult> Search(SolrQueryParameters parameters) async {
    var response = await restClient.get(
      '/select',
      queryParameters: parameters.toMap(),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> data = response.data;

      return SolrResult.fromMap(data);
    }

    return null;
  }

  Future<int> SearchNumberFound(SolrQueryParameters parameters) async {
    try {
      final response = await restClient.get(
        '/select',
        queryParameters: parameters.toMap(),
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> data = response.data;

        final result = SolrResult.fromMap(data);

        return result.response.numFound;
      }
    } catch (ex) {
      print(ex);
    }

    return 0;
  }
}
