import 'package:get_it/get_it.dart';
import 'package:tv_shows/features/shows/service/shows_service.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  locator.registerLazySingleton<ShowsService>(() => ShowsService());
}
