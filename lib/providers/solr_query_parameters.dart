class SolrQueryParameters {
  String query;
  String sort;
  int start;
  int rows;
  String filterQuery;
  String filedList;
  String responseWriter;

  SolrQueryParameters({
    this.query = '*:*',
    this.sort,
    this.start,
    this.rows,
    this.filterQuery,
    this.filedList,
    this.responseWriter = 'json',
  });

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    if (query != null) {
      data['q'] = query;
    }

    if (sort != null) {
      data['sort'] = sort;
    }

    if (start != null) {
      data['start'] = start;
    }

    if (rows != null) {
      data['rows'] = rows;
    }

    if (filterQuery != null) {
      data['fq'] = filterQuery;
    }

    if (filedList != null) {
      data['fl'] = filedList;
    }

    if (responseWriter != null) {
      data['wt'] = responseWriter;
    }

    return data;
  }
}
