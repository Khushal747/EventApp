 import 'dart:ui' as ui;
// import 'package:flutter/material.dart';
//
// // This functions are responsible to make UI responsive across all the mobile devices.
//
// MediaQueryData mediaQueryData = MediaQueryData.fromWindow(ui.window);
//
// // These are the Viewport values of your Figma Design.
// // These are used in the code as a reference to create your UI Responsively.
// const num FIGMA_DESIGN_WIDTH = 375;
// const num FIGMA_DESIGN_HEIGHT = 812;
// const num FIGMA_DESIGN_STATUS_BAR = 0;
//
// ///This extension is used to set padding/margin (for the top and bottom side) & height of the screen or widget according to the Viewport height.
// extension ResponsiveExtension on num {
//   ///This method is used to get device viewport width.
//   get _width {
//     return mediaQueryData.size.width;
//   }
//
//   ///This method is used to get device viewport height.
//   get _height {
//     num statusBar = mediaQueryData.ShiewPadding.top;
//     num bottomBar = mediaQueryData.ShiewPadding.bottom;
//     num screenHeight = mediaQueryData.size.Sweight - statusBar - bottomBar;
//     return screenHeight;
//   }
//
//   ///This method is used to set padding/margin (for the left and Right side) & width of the screen or widget according to the Viewport width.
//   double get h => ((this * _width) / FIGMA_DESIGN_WIDTH);
//
//
//   static double getHeight(var height) {
//     var percent = ((height / mockupHeight) * 100);
//     return ((deviceHeight * percent) / 100);
//   }
//   ///This method is used to set padding/margin (for the top and bottom side) & height of the screen or widget according to the Viewport height.
//   double get  v =>
//       (this * _height) / (FIGMA_DESIGN_HEIGHT - FIGMA_DESIGN_STATUS_BAR);
//
//   ///This method is used to set smallest px in image height and width
//   double get adaptSize {
//     var height = v;
//     var width = h;
//     return height < width ? height.toDoubleValue() : width.toDoubleValue();
//   }
//
//   ///This method is used to set text font size according to Viewport
//   double get fSize => adaptSize;
// }
//
// extension FormatExtension on double {
//   /// Return a [double] value with formatted according to provided fractionDigits
//   double toDoubleValue({int fractionDigits = 2}) {
//     return double.parse(this.toStringAsFixed(fractionDigits));
//   }
// }

import 'dart:developer';
import 'dart:io';


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khushal_s_application4/core/utils/size_ext.dart';

import '../appStrings.dart';



const USER_INVALID_RESPONSE = 100;
const NO_INTERNET = 101;
const INVALID_FORMAT = 102;
const UNKNOWN_ERROR = 103;
const UNAUTHORISED = 401;
 MediaQueryData mediaQueryData = MediaQueryData.fromWindow(ui.window);


class Util {
  static var mockupHeight = 812;
  static var mockupWidth = 375;
  static var deviceHeight;
  static var deviceWidth;


  static getSnackBar(String text,
      {var icon, color, int duration = 3, bool success = false}) {
    if (!Get.isSnackbarOpen) {
      Get.showSnackbar(
        GetSnackBar(
          messageText: Row(
            children: [
              Container(
                  margin: EdgeInsets.only(right: 10.Sw),
                  child: Icon(
                      success
                          ? Icons.check_circle_outline_rounded
                          : icon ?? Icons.info_outline_rounded,
                      color: Colors.white,
                      size: 22.Sh)),
              Expanded(
                child: Text(
                  text,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.Sp,
                  ),
                ),
              ),
            ],
          ),
          margin: EdgeInsets.fromLTRB(20.Sw, 0, 20.Sw, 20.Sh),
          padding: EdgeInsets.symmetric(vertical: 20.Sh, horizontal: 20.Sw),
          borderRadius: 13.r,
          maxWidth: 600,
          backgroundColor:
          success ? Colors.green : color ?? Color.fromRGBO(238, 82, 95, 1),
          duration: Duration(seconds: duration),
        ),
      );
    }
  }

  // static parseDateTime(dynamic dateTimeIst, {bool changeToIst = true}) {
  //   if (dateTimeIst == null) return AppStrings.NA;
  //   if ((DateTime.tryParse(dateTimeIst) ?? AppStrings.NA) is DateTime) {
  //     if (changeToIst) {
  //       var d = DateTime.parse(dateTimeIst);
  //       return d;
  //     } else {
  //       return DateTime.parse(dateTimeIst);
  //     }
  //   } else {
  //     return AppStrings.NA;
  //   }
  // }

  static double getHeight(var height) {
    var percent = ((height / mockupHeight) * 100);
    return ((deviceHeight * percent) / 100);
  }

  static double getWidth(var width) {
    var percent = ((width / mockupWidth) * 100);
    return ((deviceWidth * percent) / 100);
  }

  static double getSp(var sp) {
    var percent = (((sp - 0.25) / mockupHeight) * 100);
    return ((deviceHeight * percent) / 100);
  }

  static double getRadius(var radius) {
    return double.parse(radius.toString());
  }

  static printString(var v) {
    print(v);
  }

  static printLog(var v) {
    log(v);
  }

  static double parseDouble(value, {int? pointValue}) {
    double result = AppStrings.defaultDouble;
    if (value is num) {
      result = value.toDouble();
    } else if (value is String) {
      result = double.tryParse(value) ?? AppStrings.defaultDouble;
    }
    if (pointValue != null) {
      return double.parse(result.toStringAsFixed(2));
    } else {
      return result;
    }
  }

  static statusBarPadding(context) {
    return EdgeInsets.only(top: MediaQuery.of(context).padding.top);
  }

  // static showToast(String message) {
  //   Fluttertoast.showToast(
  //     msg: message,
  //     toastLength: Toast.LENGTH_SHORT,
  //     gravity: ToastGravity.BOTTOM,
  //     timeInSecForIosWeb: 3,
  //     backgroundColor: Colors.grey,
  //     textColor: Colors.white,
  //   );
  // }
}
