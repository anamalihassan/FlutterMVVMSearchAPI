import 'package:json_annotation/json_annotation.dart';
import 'package:tv_shows/features/shows/model/country_obj.dart';
part 'network_obj.g.dart';

@JsonSerializable()
class NetworkObj{
  String name;
  int id;
  CountryObj country;


  NetworkObj({this.name, this.id, this.country});

  factory NetworkObj.fromJson(Map<String, dynamic> json) => _$NetworkObjFromJson(json);

  Map<String, dynamic> toJson() => _$NetworkObjToJson(this);

}