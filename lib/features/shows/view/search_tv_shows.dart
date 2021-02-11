import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tv_shows/features/commons/utils/app_colors.dart';
import 'package:tv_shows/features/commons/utils/app_font.dart';
import 'package:tv_shows/features/shows/model/tv_shows_result.dart';
import 'package:tv_shows/features/shows/view/commons.dart';
import 'package:tv_shows/features/shows/view/show_detail_view.dart';
import 'package:tv_shows/features/shows/view/shows_view_model.dart';

class SearchTVShows extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<SearchTVShows> {
  ShowsViewModel _viewModel = ShowsViewModel();
  final _searchController = TextEditingController();
  bool isLoading = false;
  List<TVShowsResult> tvShowsList = List<TVShowsResult>();
  Timer timeHandle;

  void callSearchOnTextChanged(String search) {
    String inputSearch = search.length > 0 ? search : "girl";
    if (timeHandle != null) {
      timeHandle.cancel();
    }
    timeHandle = Timer(Duration(seconds: 1), () {
      _viewModel.searchTVShows(this, inputSearch);
    });
  }

  void goToDetail(int index) {
    Navigator.push(
        context,MaterialPageRoute(
        builder: (context) =>
            ShowDetailView(tvShowsList[index])));
  }

  @override
  void initState() {
    super.initState();
    _viewModel.searchTVShows(this, "girl");
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset('assets/images/logo.png',
            height: 35, fit: BoxFit.cover),
        backgroundColor: AppColors.headerThemeColor,
      ),
      body: Center(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              getSearchRow(),
              tvShowsList.isNotEmpty ? _buildList() : _buildEmptyView(),
            ]),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _buildProgressIndicator() {
    return new Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Center(
        child: new Opacity(
          opacity: isLoading ? 1.0 : 00,
          child: new CircularProgressIndicator(),
        ),
      ),
    );
  }

  _buildEmptyView() {
    return Center(
        child: isLoading
            ? _buildProgressIndicator()
            : Commons.padded(child: Text("No Shows Available")));
  }

  Widget _buildList() {
    return Expanded(
        child: ListView.builder(
      //+1 for progressbar
      itemCount: tvShowsList.length,
      itemBuilder: (BuildContext context, int index) {
        if (index == tvShowsList.length) {
          return _buildProgressIndicator();
        } else {
          return GestureDetector(
            child: _buildListItem(tvShowsList[index]),
            onTap: () => {goToDetail(index)},
          );
        }
      },
    ));
  }

  Widget _buildListItem(TVShowsResult showsResult) {
    String rating = "Rating: " +
        ((showsResult.show.rating != null &&
                showsResult.show.rating.average != null)
            ? showsResult.show.rating.average.toString()
            : "N/A");
    var concatenate = StringBuffer();
    if (showsResult.show.genres != null) {
      showsResult.show.genres.forEach((item) {
        if (concatenate.isNotEmpty) {
          concatenate.write(", ");
        }
        concatenate.write(item);
      });
    }
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: new BorderRadius.circular(4.0),
          border: Border.all(color: AppColors.grey),
        ),
        margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Commons.getImage(50,80,showsResult.show.image != null
                        ? showsResult.show.image.medium
                        : ""),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                              height: 25,
                              child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8, right: 8, top: 6),
                                  child: Text(
                                    showsResult.show.name,
                                    maxLines: 5,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: AppColors.blue,
                                        fontSize: AppFonts.bodySize,
                                        fontFamily: AppFonts.medium),
                                  ))),
                          concatenate.isNotEmpty
                              ? SizedBox(
                                  height: 20,
                                  child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8, right: 8, top: 2),
                                      child: Text(
                                        concatenate.toString(),
                                        maxLines: 5,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            color: AppColors.black70,
                                            fontSize: AppFonts.captionSize,
                                            fontFamily: AppFonts.regular),
                                      )))
                              : Container(),
                          SizedBox(
                              height: 20,
                              child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8, right: 8, top: 2),
                                  child: Text(
                                    rating,
                                    maxLines: 5,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: AppColors.black50,
                                        fontSize: AppFonts.captionSize,
                                        fontFamily: AppFonts.regular),
                                  )))
                        ]),
                  ]),
              Image.asset(
                "assets/images/ic_arrow_right.png",
                color: AppColors.blue,
                height: 24,
                width: 24,
              ),
            ],
          ),
        ));
  }

  Widget getSearchRow() {
    return Commons.padded(
        child: TextFormField(
      controller: _searchController,
      textInputAction: TextInputAction.search,
      onFieldSubmitted: (term) {
        callSearchOnTextChanged(_searchController.text);
      },
      key: Key('search'),
      onChanged: callSearchOnTextChanged,
      style:
          TextStyle(fontSize: AppFonts.bodySize, fontFamily: AppFonts.regular),
      decoration: InputDecoration(
        icon: Icon(Icons.tv),
        labelText: "Search TV Shows",
        suffixIcon: IconButton(
          onPressed: () => _searchController.clear(),
          icon: Icon(Icons.clear),
        ),
      ),
    ));
  }
}
