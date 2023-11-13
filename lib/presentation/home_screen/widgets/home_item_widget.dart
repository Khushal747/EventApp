// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:intl/intl.dart';
// import 'package:khushal_s_application4/core/app_export.dart';
// import 'package:khushal_s_application4/model/event_model.dart';
//
// import '../../../helper/abbreviation.dart';
// import '../../../responsive/responsive_app.dart';
// import '../../../theme/custom_text_style.dart';
// import '../../../theme/custom_text_style.dart';
// import '../../event_details_screen/event_details_screen.dart';
//
// // ignore: must_be_immutable
// class HomeItemWidget extends StatefulWidget {
//   final Event event;
//
//   HomeItemWidget({Key? key, required this.event}) : super(key: key);
//
//   @override
//   State<HomeItemWidget> createState() => _HomeItemWidgetState();
// }
//
// class _HomeItemWidgetState extends State<HomeItemWidget> {
//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;
//
//     double titleSmallFontSize =
//         Responsive.isSmallScreen(context) ? width / 26.0 : width / 18.0;
//     double bodyMediumFontSize =
//         Responsive.isSmallScreen(context) ? width / 30.0 : width / 15.0;
//     double headline6FontSize =
//         Responsive.isSmallScreen(context) ? width / 47.0 : width / 38.0;
//
//     String dateTimeString = "${widget.event.dateTime}";
//
//     DateTime dateTime = DateTime.parse(dateTimeString);
//     String formattedDay =
//         DateFormat.E().format(dateTime); // Abbreviated day (e.g., Mon)
//     String formattedDate = DateFormat.MMMd()
//         .format(dateTime); // Abbreviated month and day (e.g., Apr 12)
//
//     return GestureDetector(
//       onTap: () {
//         Get.to(() => EventDetailsScreen(eventId: widget.event.id));
//       },
//       child: Container(
//         padding: EdgeInsets.symmetric(vertical: 7.v),
//         decoration: AppDecoration.outlineBlueGrayF.copyWith(
//           borderRadius: BorderRadiusStyle.roundedBorder16,
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             Container(
//               height: 92.v,
//               width: 79.h,
//               decoration: AppDecoration.fillOrange.copyWith(
//                 borderRadius: BorderRadiusStyle.roundedBorder10,
//               ),
//               child: CustomImageView(
//                 imagePath: widget.event.bannerImage,
//                 height: 92.v,
//                 width: 79.h,
//                 fit: BoxFit.cover,
//                 radius: BorderRadius.circular(
//                   10.h,
//                 ),
//                 alignment: Alignment.center,
//               ),
//             ),
//             Container(
//               margin: EdgeInsets.only(
//                 left: 10.h,
//                 top: 3.v,
//                 bottom: 4.v,
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     children: [
//                       Padding(
//                         padding: EdgeInsets.only(right: 5.h),
//                         child: Container(
//                           child: Text(
//                             "$formattedDay,",
//                             style: theme.textTheme.bodyMedium?.copyWith(
//                               fontSize: bodyMediumFontSize,
//                             ),
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.only(right: 5.h),
//                         child: Container(
//                           child: Text(
//                             "$formattedDate",
//                             style: theme.textTheme.bodyMedium?.copyWith(
//                               fontSize: bodyMediumFontSize,
//                             ),
//                           ),
//                         ),
//                       ),
//                       Padding(
//                           padding: EdgeInsets.only(left: 2.h, right: 5.h),
//                           child: Icon(
//                             Icons.circle,
//                             size: 5,
//                             color: Colors.blueAccent,
//                           )),
//                       Padding(
//                         padding: EdgeInsets.only(right: 5.h),
//                         child: Container(
//                           child: Text(
//                             "${formatTime(widget.event.dateTime)}",
//                             style: theme.textTheme.bodyMedium?.copyWith(
//                               fontSize: bodyMediumFontSize,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   // SizedBox(height: 2.v),
//                   Padding(
//                     padding: EdgeInsets.only(top: 3),
//                     child: Container(
//                       child: Text(
//                         widget.event.title,
//                         maxLines: 2,
//                         overflow: TextOverflow.ellipsis,
//                         style: theme.textTheme.titleSmall?.copyWith(
//                           fontSize: titleSmallFontSize,
//                         ),
//                       ),
//                     ),
//                   ),
//
//                   SizedBox(height: 9.v),
//                   Row(
//                     children: [
//                       Container(
//                         child: Icon(
//                           Icons.location_on_rounded,
//                           size: 12,
//                           color: Colors.grey,
//                         ),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.only(left: 1.h, right: 3.h),
//                         child: Container(
//                           child: Text(
//                             widget.event.venueName,
//                             style: CustomTextStyles.titleMediumGray60010.copyWith(
//                               fontSize: headline6FontSize,
//                             ),
//
//                             // fontSize: 8.adaptSize,
//                           ),
//                         ),
//                       ),
//                       Padding(
//                           padding: EdgeInsets.only(left: 1.h, right: 2.h),
//                           child: Icon(
//                             Icons.circle,
//                             size: 4,
//                             color: Colors.grey,
//                           )),
//                       Padding(
//                         padding: EdgeInsets.only(right: 2.h),
//                         child: Container(
//                           child: Text(
//                             "${widget.event.venueCity},",
//                             style: CustomTextStyles.titleMediumGray60010,
//                           ),
//                         ),
//                       ),
//                       Container(
//                         child: Text(
//                           CountryAbbreviationHelper.getAbbreviation(
//                               widget.event.venueCountry),
//                           style: CustomTextStyles.titleMediumGray60010,
//                         ),
//                       )
//                     ],
//                   )
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   String getMonthAbbreviation(int month) {
//     return DateTime(2023, month).toString().split(' ')[0];
//   }
//
//   String formatTime(DateTime dateTime) {
//     return "${dateTime.hour}:${dateTime.minute} ${dateTime.hour >= 12 ? 'PM' : 'AM'}";
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:khushal_s_application4/core/app_export.dart';
import 'package:khushal_s_application4/model/event_model.dart';

import '../../../helper/abbreviation.dart';
import '../../../responsive/responsive_app.dart';
import '../../../theme/custom_text_style.dart';
import '../../event_details_screen/event_details_screen.dart';

class HomeItemWidget extends StatefulWidget {
  final Event event;

  HomeItemWidget({Key? key, required this.event}) : super(key: key);

  @override
  State<HomeItemWidget> createState() => _HomeItemWidgetState();
}

class _HomeItemWidgetState extends State<HomeItemWidget> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    bool isLargeScreen = width > 800;

    double titleSmallFontSize =
    Responsive.isSmallScreen(context) ? width / 26.0 : width / 18.0;
    double bodyMediumFontSize =
    Responsive.isSmallScreen(context) ? width / 30.0 : width / 15.0;
    double headline6FontSize =
    Responsive.isSmallScreen(context) ? width / 47.0 : width / 38.0;

    if (isLargeScreen) {
      // Adjust sizes for large screens
      titleSmallFontSize = width / 22.0;
      bodyMediumFontSize = width / 20.0;
      headline6FontSize = width / 32.0;
    }

    String dateTimeString = "${widget.event.dateTime}";

    DateTime dateTime = DateTime.parse(dateTimeString);
    String formattedDay = DateFormat.E().format(dateTime);
    String formattedDate = DateFormat.MMMd().format(dateTime);

    return GestureDetector(
      onTap: () {
        Get.to(() => EventDetailsScreen(eventId: widget.event.id));
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: isLargeScreen ? 14.0 : 7.v),
        decoration: AppDecoration.outlineBlueGrayF.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder16,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: isLargeScreen ? 120.v : 92.v,
              width: isLargeScreen ? 100.h : 79.h,
              decoration: AppDecoration.fillOrange.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder10,
              ),
              child: CustomImageView(
                imagePath: widget.event.bannerImage,
                height: isLargeScreen ? 120.v : 92.v,
                width: isLargeScreen ? 100.h : 79.h,
                fit: BoxFit.cover,
                radius: BorderRadius.circular(
                  isLargeScreen ? 12.h : 10.h,
                ),
                alignment: Alignment.center,
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                left: isLargeScreen ? 15.h : 10.h,
                top: isLargeScreen ? 5.v : 3.v,
                bottom: isLargeScreen ? 6.v : 4.v,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            right: isLargeScreen ? 8.h : 5.h),
                        child: Container(
                          child: Text(
                            "$formattedDay,",
                            style: theme.textTheme.bodyMedium?.copyWith(
                              fontSize: bodyMediumFontSize,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            right: isLargeScreen ? 8.h : 5.h),
                        child: Container(
                          child: Text(
                            "$formattedDate",
                            style: theme.textTheme.bodyMedium?.copyWith(
                              fontSize: bodyMediumFontSize,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 2.h, right: isLargeScreen ? 8.h : 5.h),
                        child: Icon(
                          Icons.circle,
                          size: isLargeScreen ? 6 : 5,
                          color: Colors.blueAccent,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            right: isLargeScreen ? 8.h : 5.h),
                        child: Container(
                          child: Text(
                            "${formatTime(widget.event.dateTime)}",
                            style: theme.textTheme.bodyMedium?.copyWith(
                              fontSize: bodyMediumFontSize,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: isLargeScreen ? 8 : 3),
                    child: Container(
                      child: Text(
                        widget.event.title,
                        maxLines: isLargeScreen ? 2 : 1,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.titleSmall?.copyWith(
                          fontSize: titleSmallFontSize,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: isLargeScreen ? 16.v : 9.v),
                  Row(
                    children: [
                      Container(
                        child: Icon(
                          Icons.location_on_rounded,
                          size: isLargeScreen ? 16 : 12,
                          color: Colors.grey,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 2.h, right: isLargeScreen ? 10.h : 3.h),
                        child: Container(
                          child: Text(
                            widget.event.venueName,
                            style: CustomTextStyles.titleMediumGray60010.copyWith(
                              fontSize: headline6FontSize,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 2.h, right: isLargeScreen ? 6.h : 2.h),
                        child: Icon(
                          Icons.circle,
                          size: isLargeScreen ? 8 : 4,
                          color: Colors.grey,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            right: isLargeScreen ? 6.h : 2.h),
                        child: Container(
                          child: Text(
                            "${widget.event.venueCity},",
                            style: CustomTextStyles.titleMediumGray60010,
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          CountryAbbreviationHelper.getAbbreviation(
                              widget.event.venueCountry),
                          style: CustomTextStyles.titleMediumGray60010,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String getMonthAbbreviation(int month) {
    return DateTime(2023, month).toString().split(' ')[0];
  }

  String formatTime(DateTime dateTime) {
    return "${dateTime.hour}:${dateTime.minute} ${dateTime.hour >= 12 ? 'PM' : 'AM'}";
  }
}
