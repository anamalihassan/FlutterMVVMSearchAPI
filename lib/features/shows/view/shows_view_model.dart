import 'package:tv_shows/features/commons/config/locator.dart';
import 'package:tv_shows/features/shows/model/tv_shows_result.dart';
import 'package:tv_shows/features/shows/service/shows_service.dart';

final _showsService = locator<ShowsService>();

class ShowsViewModel {


  void searchTVShows(_viewState, String search) async {
    if (!_viewState.isLoading) {
      _viewState.setState(() {
        _viewState.isLoading = true;
      });
      List<TVShowsResult> tvShows =
      await _showsService.searchTVShows(_viewState, search);
      _viewState.setState(() {
        _viewState.isLoading = false;
        _viewState.tvShowsList = tvShows;
      });
    };
  }
}
