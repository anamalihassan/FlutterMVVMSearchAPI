
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:tv_shows/features/shows/model/tv_shows_result.dart';

part 'shows_api_client.g.dart';

@RestApi()
abstract class ShowsApiClient {

  factory ShowsApiClient(Dio dio, {String baseUrl}) = _ShowsApiClient;


  @GET("/search/shows")
  Future<List<TVShowsResult>> searchTVShows(@Query("q") String search);
}
