import 'package:json_annotation/json_annotation.dart';
import 'package:tv_shows/features/shows/model/image_obj.dart';
import 'package:tv_shows/features/shows/model/network_obj.dart';
import 'package:tv_shows/features/shows/model/rating_obj.dart';
import 'package:tv_shows/features/shows/model/schedule_obj.dart';
part 'show_detail.g.dart';

@JsonSerializable()
class ShowDetail{
  int id;
  String url;
  String name;
  String type;
  String language;
  List<String> genres;
  String status;
  int runtime;
  String premiered;
  String officialSite;
  ScheduleObj schedule;
  RatingObj rating;
  int weight;
  NetworkObj network;
  NetworkObj webChannel;
  ImageObj image;
  String summary;
  int updated;
  double temperatureMax;


  ShowDetail({
      this.id,
      this.url,
      this.name,
      this.type,
      this.language,
      this.genres,
      this.status,
      this.runtime,
      this.premiered,
      this.officialSite,
      this.schedule,
      this.rating,
      this.weight,
      this.network,
      this.webChannel,
      this.image,
      this.summary,
      this.updated,
      this.temperatureMax});

  factory ShowDetail.fromJson(Map<String, dynamic> json) => _$ShowDetailFromJson(json);

  Map<String, dynamic> toJson() => _$ShowDetailToJson(this);

}