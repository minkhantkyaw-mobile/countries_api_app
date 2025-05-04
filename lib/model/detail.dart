import 'package:json_annotation/json_annotation.dart';
part 'detail.g.dart';

@JsonSerializable()
class Detail {
  final String? name;
  final String? region;
  final String? subRegion;
  final int? population;
  final String? demonyms;
  final String? cca2;

  Detail({
    required this.name,
    required this.region,
    required this.subRegion,
    required this.population,
    required this.demonyms,
    required this.cca2,
  });

  factory Detail.fromJson(Map<String, dynamic> json) => _$DetailFromJson(json);
}
