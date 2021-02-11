import 'package:json_annotation/json_annotation.dart';
part 'rating_obj.g.dart';

@JsonSerializable()
class RatingObj{
  double average;


  RatingObj({this.average});

  factory RatingObj.fromJson(Map<String, dynamic> json) => _$RatingObjFromJson(json);

  Map<String, dynamic> toJson() => _$RatingObjToJson(this);

}