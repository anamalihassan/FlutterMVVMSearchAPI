import 'package:json_annotation/json_annotation.dart';
part 'image_obj.g.dart';

@JsonSerializable()
class ImageObj{
  String original;
  String medium;


  ImageObj({this.original, this.medium});

  factory ImageObj.fromJson(Map<String, dynamic> json) => _$ImageObjFromJson(json);

  Map<String, dynamic> toJson() => _$ImageObjToJson(this);

}