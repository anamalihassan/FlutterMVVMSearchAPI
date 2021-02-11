import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tv_shows/features/commons/utils/app_colors.dart';
import 'package:tv_shows/features/commons/utils/app_font.dart';
import 'package:tv_shows/features/shows/model/tv_shows_result.dart';
import 'package:tv_shows/features/shows/view/shows_view_model.dart';

class AddressSearch extends SearchDelegate<TVShowsResult> {

  ShowsViewModel _viewModel = ShowsViewModel();

  handleShowSelection(context, TVShowsResult showsResult){
    close(context, showsResult);
  }


  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        tooltip: 'Clear',
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      tooltip: 'Back',
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return null;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder(
      // future: query == ""
      //     ? null
      //     : _viewModel.searchTVShows(this, query),
      builder: (context, snapshot) => query == ''
          ? Container(
              padding: EdgeInsets.all(16.0),
              child: Text('Search TV Show'),
            )
          : snapshot.hasData
              ? ListView.builder(
                  itemBuilder: (context, index) => GestureDetector(
                    child: _buildListItem(snapshot.data[index] as TVShowsResult),
                    onTap: () => {
                      handleShowSelection(context, snapshot.data[index] as TVShowsResult)
                    },
                  ),
                  itemCount: snapshot.data.length,
                )
              : Container(child: Text('Loading...')),
    );
  }

  Widget _buildListItem(TVShowsResult showsResult) {
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
                getUserProfileImage(showsResult.show.image.medium),
                SizedBox(height: 30,
                    child:Padding(
                        padding: const EdgeInsets.only(left: 8, right: 8, top: 6),
                        child: Text(showsResult.show.name, style: TextStyle(color: AppColors.blue,fontSize: AppFonts.subHeaderSize, fontFamily: AppFonts.medium),))),
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


  Widget getUserProfileImage(String imageUrl){
    if (imageUrl == null || imageUrl == ''){
      return Image.asset('assets/images/tvshow.png');
    }else{
      return CachedNetworkImage(
          placeholder: (context, url) => CircularProgressIndicator(),
          imageUrl: imageUrl, width: 50, height: 80, fit: BoxFit.fill
      );
    }
  }
}
