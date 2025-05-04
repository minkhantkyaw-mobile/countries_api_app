class Country {
  final String? common;
  final String? official;
  final String? cca2;

  Country({required this.common, required this.official, required this.cca2});

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      common:
          json['name'] != null && json['name']['common'] != null
              ? json['name']['common'] as String
              : null,
      official: json['region'] != null ? json['region'] as String : null,
      cca2: json['cca2'] != null ? json['cca2'] as String : null,
    );
  }

  @override
  String toString() {
    return 'Country(common: \$common, region: \$region, cca2: \$cca2)';
  }
}
