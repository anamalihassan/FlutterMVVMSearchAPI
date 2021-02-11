import 'package:json_annotation/json_annotation.dart';
part 'schedule_obj.g.dart';

@JsonSerializable()
class ScheduleObj{
  String time;
  List<String> days;


  ScheduleObj({this.time, this.days});

  factory ScheduleObj.fromJson(Map<String, dynamic> json) => _$ScheduleObjFromJson(json);

  Map<String, dynamic> toJson() => _$ScheduleObjToJson(this);

}