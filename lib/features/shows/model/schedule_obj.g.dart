// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_obj.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScheduleObj _$ScheduleObjFromJson(Map<String, dynamic> json) {
  return ScheduleObj(
    time: json['time'] as String,
    days: (json['days'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$ScheduleObjToJson(ScheduleObj instance) =>
    <String, dynamic>{
      'time': instance.time,
      'days': instance.days,
    };
