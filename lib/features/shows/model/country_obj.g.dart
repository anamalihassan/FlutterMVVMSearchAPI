// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_obj.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CountryObj _$CountryObjFromJson(Map<String, dynamic> json) {
  return CountryObj(
    name: json['name'] as String,
    code: json['code'] as String,
    timezone: json['timezone'] as String,
  );
}

Map<String, dynamic> _$CountryObjToJson(CountryObj instance) =>
    <String, dynamic>{
      'name': instance.name,
      'code': instance.code,
      'timezone': instance.timezone,
    };
