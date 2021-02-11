// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_obj.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NetworkObj _$NetworkObjFromJson(Map<String, dynamic> json) {
  return NetworkObj(
    name: json['name'] as String,
    id: json['id'] as int,
    country: json['country'] == null
        ? null
        : CountryObj.fromJson(json['country'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$NetworkObjToJson(NetworkObj instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'country': instance.country,
    };
