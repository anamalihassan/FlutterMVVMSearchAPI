import 'package:json_annotation/json_annotation.dart';
import 'package:tv_shows/features/shows/model/show_detail.dart';
part 'tv_shows_result.g.dart';

@JsonSerializable()
class TVShowsResult{
  double score;
  ShowDetail show;


  TVShowsResult({this.score, this.show});

  factory TVShowsResult.fromJson(Map<String, dynamic> json) => _$TVShowsResultFromJson(json);

  Map<String, dynamic> toJson() => _$TVShowsResultToJson(this);

}