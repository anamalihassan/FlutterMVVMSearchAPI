import 'package:flutter/material.dart';
import 'package:tv_shows/features/commons/config/app_config.dart';
import 'package:tv_shows/features/commons/config/locator.dart';
import 'package:tv_shows/features/shows/view/search_tv_shows.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setupLocator();
  String env = String.fromEnvironment("env");
  print(env);
  env = 'dev';
  final appConfig = await AppConfig.forEnvironment(env,true);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  MyApp();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'TV Shows',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
          // This makes the visual density adapt to the platform that you run
          // the app on. For desktop platforms, the controls will be smaller and
          // closer together (more dense) than on mobile platforms.
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: SearchTVShows(),
        routes: {
          '/home': (context) => SearchTVShows(),
        }
    );
  }
}