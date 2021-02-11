// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shows_api_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _ShowsApiClient implements ShowsApiClient {
  _ShowsApiClient(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<List<TVShowsResult>> searchTVShows(search) async {
    ArgumentError.checkNotNull(search, 'search');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'q': search};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<List<dynamic>>('/search/shows',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => TVShowsResult.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }
}
