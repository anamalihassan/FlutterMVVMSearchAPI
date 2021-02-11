// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv_shows_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TVShowsResult _$TVShowsResultFromJson(Map<String, dynamic> json) {
  return TVShowsResult(
    score: (json['score'] as num)?.toDouble(),
    show: json['show'] == null
        ? null
        : ShowDetail.fromJson(json['show'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$TVShowsResultToJson(TVShowsResult instance) =>
    <String, dynamic>{
      'score': instance.score,
      'show': instance.show,
    };
