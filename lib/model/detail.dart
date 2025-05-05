class Detail {
  final String? commonName;
  final String? officialName;
  final String? region;
  final String? subRegion;
  final int? population;
  final String? demonym;
  final String? cca2;

  Detail({
    required this.commonName,
    required this.officialName,
    required this.region,
    required this.subRegion,
    required this.population,
    required this.demonym,
    required this.cca2,
  });

  factory Detail.fromJson(Map<String, dynamic> json) {
    String? extractString(dynamic value) {
      if (value is String) return value;
      return null;
    }

    return Detail(
      commonName:
          json['name'] != null && json['name'] is Map<String, dynamic>
              ? extractString(json['name']['common'])
              : null,
      officialName:
          json['name'] != null && json['name'] is Map<String, dynamic>
              ? extractString(json['name']['official'])
              : null,
      region: extractString(json['region']),
      subRegion: extractString(json['subregion']),
      population: json['population'] is int ? json['population'] as int : null,
      demonym:
          json['demonyms'] != null && json['demonyms'] is Map<String, dynamic>
              ? extractString(json['demonyms']['eng'])
              : null,
      cca2: extractString(json['cca2']),
    );
  }
}
