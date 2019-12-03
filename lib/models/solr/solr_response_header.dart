class SolrResponseHeader {
  final int status;
  final int qTime;

  SolrResponseHeader({
    this.status,
    this.qTime,
  });

  factory SolrResponseHeader.fromMap(Map<String, dynamic> map) => map == null
      ? null
      : SolrResponseHeader(
          status: map['status']?.toInt(),
          qTime: map['QTime']?.toInt(),
        );

  @override
  String toString() => 'ResponseHeader status: $status, QTime: $qTime';
}
