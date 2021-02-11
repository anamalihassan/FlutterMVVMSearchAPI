import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:tv_shows/features/commons/utils/app_colors.dart';
import 'package:tv_shows/features/commons/widets/info_row_widget.dart';
import 'package:tv_shows/features/shows/model/tv_shows_result.dart';
import 'package:tv_shows/features/shows/view/commons.dart';

class ShowDetailView extends StatelessWidget {
  TVShowsResult showsResult;

  ShowDetailView(this.showsResult);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(showsResult.show.name,
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: AppColors.white)),
          backgroundColor: AppColors.headerThemeColor,
        ),
        backgroundColor: AppColors.white,
        body: Container(
          constraints: BoxConstraints.expand(),
          child: new SingleChildScrollView(
              child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: new BorderRadius.circular(4.0),
              border: Border.all(color: AppColors.grey),
            ),
            margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: buildList(),
            ),
          )),
        ));
  }


  List<Widget> buildList() {
    String rating = "" +
        ((showsResult.show.rating != null &&
            showsResult.show.rating.average != null)
            ? showsResult.show.rating.average.toString()
            : "N/A");
    var genres = StringBuffer();
    if (showsResult.show.genres != null) {
      showsResult.show.genres.forEach((item) {
        if (genres.isNotEmpty) {
          genres.write(", ");
        }
        genres.write(item);
      });
    }
    List<Widget> list = [];
    list.add(Commons.padded(child: Commons.getImage(80,130,showsResult.show.image != null
        ? showsResult.show.image.medium
        : "")));
    list.add(Commons.padded(child: Html(data: showsResult.show.summary)));
    list.add(InfoRowWidget("Genres", genres.toString()));
    list.add(Divider());
    list.add(InfoRowWidget("Rating", rating));
    list.add(Divider());
    list.add(InfoRowWidget("Language", showsResult.show.language));
    list.add(Divider());
    list.add(InfoRowWidget("Premiered", showsResult.show.premiered));
    return list;
  }
}
