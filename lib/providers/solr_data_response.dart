import 'dart:convert';

class SolrDataResponse {
  final ResponseHeader responseHeader;
  final Response response;
  SolrDataResponse({
    this.responseHeader,
    this.response,
  });

  SolrDataResponse copyWith({
    ResponseHeader responseHeader,
    Response response,
  }) {
    return SolrDataResponse(
      responseHeader: responseHeader ?? this.responseHeader,
      response: response ?? this.response,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'responseHeader': responseHeader.toMap(),
      'response': response.toMap(),
    };
  }

  static SolrDataResponse fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return SolrDataResponse(
      responseHeader: ResponseHeader.fromMap(map['responseHeader']),
      response: Response.fromMap(map['response']),
    );
  }

  String toJson() => json.encode(toMap());

  static SolrDataResponse fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() => 'SolrDataResponse responseHeader: $responseHeader, response: $response';
}

class ResponseHeader {
  final int status;
  final int QTime;
  final Params params;
  ResponseHeader({
    this.status,
    this.QTime,
    this.params,
  });

  ResponseHeader copyWith({
    int status,
    int QTime,
    Params params,
  }) {
    return ResponseHeader(
      status: status ?? this.status,
      QTime: QTime ?? this.QTime,
      params: params ?? this.params,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'status': status,
      'QTime': QTime,
      'params': params.toMap(),
    };
  }

  static ResponseHeader fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return ResponseHeader(
      status: map['status']?.toInt(),
      QTime: map['QTime']?.toInt(),
      params: Params.fromMap(map['params']),
    );
  }

  String toJson() => json.encode(toMap());

  static ResponseHeader fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() => 'ResponseHeader status: $status, QTime: $QTime, params: $params';
}

class Params {
  final String indent;
  final String q;
  final String wt;
  Params({
    this.indent,
    this.q,
    this.wt,
  });

  Params copyWith({
    String indent,
    String q,
    String wt,
  }) {
    return Params(
      indent: indent ?? this.indent,
      q: q ?? this.q,
      wt: wt ?? this.wt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'indent': indent,
      'q': q,
      'wt': wt,
    };
  }

  static Params fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Params(
      indent: map['indent'],
      q: map['q'],
      wt: map['wt'],
    );
  }

  String toJson() => json.encode(toMap());

  static Params fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() => 'Params indent: $indent, q: $q, wt: $wt';
}

class Response {
  final int numFound;
  final int start;
  final int maxScore;
  final List<Doc> docs;
  Response({
    this.numFound,
    this.start,
    this.maxScore,
    this.docs,
  });

  Response copyWith({
    int numFound,
    int start,
    int maxScore,
    List<Doc> docs,
  }) {
    return Response(
      numFound: numFound ?? this.numFound,
      start: start ?? this.start,
      maxScore: maxScore ?? this.maxScore,
      docs: docs ?? this.docs,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'numFound': numFound,
      'start': start,
      'maxScore': maxScore,
      'docs': List<dynamic>.from(docs.map((x) => x.toMap())),
    };
  }

  static Response fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Response(
      numFound: map['numFound']?.toInt(),
      start: map['start']?.toInt(),
      maxScore: map['maxScore']?.toInt(),
      docs: List<Doc>.from(map['docs']?.map((x) => Doc.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  static Response fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'Response numFound: $numFound, start: $start, maxScore: $maxScore, docs: $docs';
  }
}

class Doc {
  final int noSearch;
  final List<String> metatagKeywords;
  final String host;
  final int aboReadOnly;
  final String metatagThumbnail;
  final String metatagPublishdate;
  final int promotion;
  final String strippedContent;
  final int allowShare;
  final String tstamp;
  final String url;
  final String id;
  final String title;
  final String metatagSearchtitle;
  final int boost;
  final List<String> metatagAllowidentities;
  final String signatureKey;
  final String modifiedDate;
  final int score;
  Doc({
    this.noSearch,
    this.metatagKeywords,
    this.host,
    this.aboReadOnly,
    this.metatagThumbnail,
    this.metatagPublishdate,
    this.promotion,
    this.strippedContent,
    this.allowShare,
    this.tstamp,
    this.url,
    this.id,
    this.title,
    this.metatagSearchtitle,
    this.boost,
    this.metatagAllowidentities,
    this.signatureKey,
    this.modifiedDate,
    this.score,
  });

  Doc copyWith({
    int noSearch,
    List<String> metatagKeywords,
    String host,
    int aboReadOnly,
    String metatagThumbnail,
    String metatagPublishdate,
    int promotion,
    String strippedContent,
    int allowShare,
    String tstamp,
    String url,
    String id,
    String title,
    String metatagSearchtitle,
    int boost,
    List<String> metatagAllowidentities,
    String signatureKey,
    String modifiedDate,
    int score,
  }) {
    return Doc(
      noSearch: noSearch ?? this.noSearch,
      metatagKeywords: metatagKeywords ?? this.metatagKeywords,
      host: host ?? this.host,
      aboReadOnly: aboReadOnly ?? this.aboReadOnly,
      metatagThumbnail: metatagThumbnail ?? this.metatagThumbnail,
      metatagPublishdate: metatagPublishdate ?? this.metatagPublishdate,
      promotion: promotion ?? this.promotion,
      strippedContent: strippedContent ?? this.strippedContent,
      allowShare: allowShare ?? this.allowShare,
      tstamp: tstamp ?? this.tstamp,
      url: url ?? this.url,
      id: id ?? this.id,
      title: title ?? this.title,
      metatagSearchtitle: metatagSearchtitle ?? this.metatagSearchtitle,
      boost: boost ?? this.boost,
      metatagAllowidentities: metatagAllowidentities ?? this.metatagAllowidentities,
      signatureKey: signatureKey ?? this.signatureKey,
      modifiedDate: modifiedDate ?? this.modifiedDate,
      score: score ?? this.score,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'noSearch': noSearch,
      'metatag.keywords': List<dynamic>.from(metatagKeywords.map((x) => x)),
      'host': host,
      'aboReadOnly': aboReadOnly,
      'metatag.thumbnail': metatagThumbnail,
      'metatag.publishdate': metatagPublishdate,
      'promotion': promotion,
      'strippedContent': strippedContent,
      'allowShare': allowShare,
      'tstamp': tstamp,
      'url': url,
      'id': id,
      'title': title,
      'metatag.searchtitle': metatagSearchtitle,
      'boost': boost,
      'metatag.allowidentities': List<dynamic>.from(metatagAllowidentities.map((x) => x)),
      'signatureKey': signatureKey,
      'modifiedDate': modifiedDate,
      'score': score,
    };
  }

  static Doc fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Doc(
      noSearch: map['noSearch']?.toInt(),
      metatagKeywords: List<String>.from(map['metatag.keywords']),
      host: map['host'],
      aboReadOnly: map['aboReadOnly']?.toInt(),
      metatagThumbnail: map['metatag.thumbnail'],
      metatagPublishdate: map['metatag.publishdate'],
      promotion: map['promotion']?.toInt(),
      strippedContent: map['strippedContent'],
      allowShare: map['allowShare']?.toInt(),
      tstamp: map['tstamp'],
      url: map['url'],
      id: map['id'],
      title: map['title'],
      metatagSearchtitle: map['metatag.searchtitle'],
      boost: map['boost']?.toInt(),
      metatagAllowidentities: List<String>.from(map['metatag.allowidentities']),
      signatureKey: map['signatureKey'],
      modifiedDate: map['modifiedDate'],
      score: map['score']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  static Doc fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'Doc noSearch: $noSearch, metatag.keywords: $metatagKeywords, host: $host, aboReadOnly: $aboReadOnly, metatagThumbnail: $metatagThumbnail, metatagPublishdate: $metatagPublishdate, promotion: $promotion, strippedContent: $strippedContent, allowShare: $allowShare, tstamp: $tstamp, url: $url, id: $id, title: $title, metatagSearchtitle: $metatagSearchtitle, boost: $boost, metatag.allowidentities: $metatagAllowidentities, signatureKey: $signatureKey, modifiedDate: $modifiedDate, score: $score';
  }
}
