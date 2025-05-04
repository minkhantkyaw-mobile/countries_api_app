// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Detail _$DetailFromJson(Map<String, dynamic> json) => Detail(
  name: json['name'] as String?,
  region: json['region'] as String?,
  subRegion: json['subRegion'] as String?,
  population: (json['population'] as num?)?.toInt(),
  demonyms: json['demonyms'] as String?,
  cca2: json['cca2'] as String?,
);

Map<String, dynamic> _$DetailToJson(Detail instance) => <String, dynamic>{
  'name': instance.name,
  'region': instance.region,
  'subRegion': instance.subRegion,
  'population': instance.population,
  'demonyms': instance.demonyms,
  'cca2': instance.cca2,
};
