import 'package:dio/dio.dart';
import 'package:tv_shows/features/commons/config/app_config.dart';
import 'package:tv_shows/features/commons/utils/log_utils.dart';
import 'package:tv_shows/features/shows/model/tv_shows_result.dart';
import 'package:tv_shows/features/shows/service/api/shows_api_client.dart';

class ShowsService {

  @override
  Future<List<TVShowsResult>> searchTVShows(_viewState, String search) async {
    List<TVShowsResult> tvShows;

    try {
      tvShows = await (await createClient()).searchTVShows(search);
      LogUtils.log(tvShows[0].toJson());
    }on DioError catch (e){
      LogUtils.log(e.message);
      LogUtils.printLog(e.response.statusCode);
      LogUtils.printLog(e.response);
      throw e;
    } catch (e) {
      LogUtils.printLog(e.toString());
      throw e;
    }
    return tvShows;
  }

  Future<ShowsApiClient> createClient() async {
    return new ShowsApiClient(new Dio(), baseUrl: AppConfig.instance.baseApiUrl);
  }
}
