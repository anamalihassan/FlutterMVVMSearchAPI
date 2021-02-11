import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:tv_shows/features/commons/utils/app_colors.dart';
import 'package:tv_shows/features/commons/utils/app_font.dart';

class Commons {

  static void showSuccessAlert(
      BuildContext context, String title, String message) {
    // flutter defined function
    Alert(
            context: context,
            type: AlertType.success,
            title: title,
            desc: message,
            buttons: [
              DialogButton(
                child: Text(
                  "OK",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onPressed: () => Navigator.pop(context),
              )
            ],
            closeFunction: () {})
        .show();
  }

  static void showErrorAlert(
      BuildContext context, String title, String message) {
    // flutter defined function
    Alert(
            context: context,
            type: AlertType.error,
            title: title,
            desc: message,
            buttons: [
              DialogButton(
                child: Text(
                  "OK",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onPressed: () => Navigator.pop(context),
              )
            ],
            closeFunction: () {})
        .show();
  }

  static void showIfnoAlert(
      BuildContext context, String title, String message) {
    // flutter defined function
    Alert(
            context: context,
            type: AlertType.info,
            title: title,
            desc: message,
            closeFunction: () {})
        .show();
  }

  static Widget padded({Widget child}) {
    return new Padding(
      padding: EdgeInsets.all(16),
      child: child,
    );
  }


  static Widget getImage(double width, double height, String imageUrl) {
    if (imageUrl == null || imageUrl == '') {
      return Image.asset('assets/images/tvshow.png');
    } else {
      return CachedNetworkImage(
          placeholder: (context, url) => CircularProgressIndicator(),
          imageUrl: imageUrl,
          width: width,
          height: height,
          fit: BoxFit.fill);
    }
  }

  static Widget submitButton(String title, Function function) {
    return Padding(
        key: Key('submit'),
        padding: EdgeInsets.only(top: 20, bottom: 8),
        child: ButtonTheme(
          minWidth: double.infinity,
          height: 50.0,
          child: RaisedButton(
            textColor: Colors.white,
            color: AppColors.blue,
            child: Text(title,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: AppFonts.bodySize,
                    fontFamily: AppFonts.regular,
                    color: AppColors.white)),
            onPressed: () {
              function();
            },
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(4.0),
            ),
          ),
        ));
  }
}
