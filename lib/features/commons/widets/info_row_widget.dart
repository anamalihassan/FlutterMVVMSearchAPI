

import 'package:flutter/material.dart';
import 'package:tv_shows/features/commons/utils/app_colors.dart';
import 'package:tv_shows/features/commons/utils/app_font.dart';

class InfoRowWidget extends StatelessWidget {

  final String title;
  final String value;
  Color valueColor = AppColors.black;

  InfoRowWidget(
    this.title,
    this.value,{this.valueColor}
  );

  @override
  Widget build(BuildContext context) {
    return buildRow(title, value);
  }

  Widget buildRow(String title, String value) {
    return new Container(
        padding: new EdgeInsets.all(14),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(title,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                      fontSize: AppFonts.bodySize,
                      color: AppColors.black50,
                      fontFamily: AppFonts.regular)),
              Flexible(
                child: Padding(
                  padding: new EdgeInsets.only(left: 5),
                  child:Text(value == null ? '-' : value,
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: AppFonts.bodySize,
                        color: valueColor,
                        fontFamily: AppFonts.medium)),
              ))
            ]));
  }
}