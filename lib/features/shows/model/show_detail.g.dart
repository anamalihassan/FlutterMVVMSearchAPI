// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'show_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShowDetail _$ShowDetailFromJson(Map<String, dynamic> json) {
  return ShowDetail(
    id: json['id'] as int,
    url: json['url'] as String,
    name: json['name'] as String,
    type: json['type'] as String,
    language: json['language'] as String,
    genres: (json['genres'] as List)?.map((e) => e as String)?.toList(),
    status: json['status'] as String,
    runtime: json['runtime'] as int,
    premiered: json['premiered'] as String,
    officialSite: json['officialSite'] as String,
    schedule: json['schedule'] == null
        ? null
        : ScheduleObj.fromJson(json['schedule'] as Map<String, dynamic>),
    rating: json['rating'] == null
        ? null
        : RatingObj.fromJson(json['rating'] as Map<String, dynamic>),
    weight: json['weight'] as int,
    network: json['network'] == null
        ? null
        : NetworkObj.fromJson(json['network'] as Map<String, dynamic>),
    webChannel: json['webChannel'] == null
        ? null
        : NetworkObj.fromJson(json['webChannel'] as Map<String, dynamic>),
    image: json['image'] == null
        ? null
        : ImageObj.fromJson(json['image'] as Map<String, dynamic>),
    summary: json['summary'] as String,
    updated: json['updated'] as int,
    temperatureMax: (json['temperatureMax'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$ShowDetailToJson(ShowDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'name': instance.name,
      'type': instance.type,
      'language': instance.language,
      'genres': instance.genres,
      'status': instance.status,
      'runtime': instance.runtime,
      'premiered': instance.premiered,
      'officialSite': instance.officialSite,
      'schedule': instance.schedule,
      'rating': instance.rating,
      'weight': instance.weight,
      'network': instance.network,
      'webChannel': instance.webChannel,
      'image': instance.image,
      'summary': instance.summary,
      'updated': instance.updated,
      'temperatureMax': instance.temperatureMax,
    };
