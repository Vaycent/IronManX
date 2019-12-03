class SolrResponse {
  final int numFound;
  final int start;
  final int maxScore;
  final List docs;

  SolrResponse({
    this.numFound,
    this.start,
    this.maxScore,
    this.docs,
  });

  factory SolrResponse.fromMap(Map<String, dynamic> map) => map == null
      ? null
      : SolrResponse(
          numFound: map['numFound']?.toInt(),
          start: map['start']?.toInt(),
          maxScore: map['maxScore']?.toInt(),
          docs: map['docs'],
          // docs: List<Doc>.from(map['docs']?.map((x) => Doc.fromMap(x))),
        );

  @override
  String toString() {
    return 'Response numFound: $numFound, start: $start, maxScore: $maxScore';
  }
}
