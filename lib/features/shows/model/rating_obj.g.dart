// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rating_obj.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RatingObj _$RatingObjFromJson(Map<String, dynamic> json) {
  return RatingObj(
    average: (json['average'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$RatingObjToJson(RatingObj instance) => <String, dynamic>{
      'average': instance.average,
    };
