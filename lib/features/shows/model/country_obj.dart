import 'package:json_annotation/json_annotation.dart';
part 'country_obj.g.dart';

@JsonSerializable()
class CountryObj{
  String name;
  String code;
  String timezone;


  CountryObj({this.name, this.code, this.timezone});

  factory CountryObj.fromJson(Map<String, dynamic> json) => _$CountryObjFromJson(json);

  Map<String, dynamic> toJson() => _$CountryObjToJson(this);

}