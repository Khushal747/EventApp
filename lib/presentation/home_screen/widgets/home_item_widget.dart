import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:khushal_s_application4/core/app_export.dart';
import 'package:khushal_s_application4/core/utils/size_ext.dart';
import 'package:khushal_s_application4/model/event_model.dart';

import '../../../helper/abbreviation.dart';
import '../../../responsive/responsive_app.dart';
import '../../../theme/custom_text_style.dart';
import '../../../theme/custom_text_style.dart';
import '../../event_details_screen/event_details_screen.dart';

// ignore: must_be_immutable
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
        Responsive.isSmallScreen(context) ? width / 48.0 : width / 38.0;

    if (isLargeScreen) {
      // Adjust sizes for large screens
      titleSmallFontSize = width / 22.0;
      bodyMediumFontSize = width / 20.0;
      headline6FontSize = width / 32.0;
    }
    String dateTimeString = "${widget.event.dateTime}";

    DateTime dateTime = DateTime.parse(dateTimeString);
    String formattedDay =
        DateFormat.E().format(dateTime); // Abbreviated day (e.g., Mon)
    String formattedDate = DateFormat.MMMd()
        .format(dateTime); // Abbreviated month and day (e.g., Apr 12)

    return GestureDetector(
      onTap: () {
        Get.to(() => EventDetailsScreen(eventId: widget.event.id));
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 7.Sh),
        decoration: AppDecoration.outlineBlueGrayF.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder16,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: isLargeScreen ? 120.Sh : 92.Sh,
              width: isLargeScreen ? 100.Sw : 79.Sw,
              decoration: AppDecoration.fillOrange.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder10,
              ),
              child: CustomImageView(
                imagePath: widget.event.bannerImage,
                height: isLargeScreen ? 120.Sh : 92.Sh,
                width: isLargeScreen ? 100.Sw : 79.Sw,
                fit: BoxFit.cover,
                radius: BorderRadius.circular(
                  isLargeScreen ? 12.Sw : 10.Sw,
                ),
                alignment: Alignment.center,
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                left: isLargeScreen ? 15.Sw : 10.Sw,
                top: isLargeScreen ? 5.Sh : 3.Sh,
                bottom: isLargeScreen ? 6.Sh : 4.Sh,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            right: isLargeScreen ? 8.Sw : 5.Sw),
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
                            right: isLargeScreen ? 8.Sw : 5.Sw),
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
                            left: 2.Sw, right: isLargeScreen ? 8.Sw : 5.Sw),
                          child: Icon(
                            Icons.circle,
                            size: isLargeScreen ? 6 : 5,
                            color: Colors.blueAccent,
                          )),
                      Padding(
                        padding: EdgeInsets.only(
                            right: isLargeScreen ? 8.Sw : 5.Sw),
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
                  // SizedBox(height: 2.Sh),
                  Padding(
                    padding: EdgeInsets.only(top: isLargeScreen ? 8 : 3),
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

                  SizedBox(height: 9.Sh),
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
                            left: 2.Sw, right: isLargeScreen ? 10.Sw : 3.Sw),                        child: Container(
                          child: Text(
                            widget.event.venueName,
                            style: CustomTextStyles.titleMediumGray60010.copyWith(
                              fontSize: headline6FontSize,
                            ),

                            // fontSize: 8.adaptSize,
                          ),
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.only(
                            left: 2.Sw, right: isLargeScreen ? 6.Sw : 2.Sw),
                          child: Icon(
                            Icons.circle,
                            size: isLargeScreen ? 8 : 4,
                            color: Colors.grey,
                          )),
                      Padding(
                        padding: EdgeInsets.only(
                            right: isLargeScreen ? 6.Sw : 2.Sw),
                        child: Container(

                          child: Text(
                            "${widget.event.venueCity},",
                            style: CustomTextStyles.titleMediumGray60010.copyWith(
                              fontSize: headline6FontSize,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 15.Sw,
                        child: Text(
                          CountryAbbreviationHelper.getAbbreviation(
                              widget.event.venueCountry),
                          style: CustomTextStyles.titleMediumGray60010.copyWith(
                            fontSize: headline6FontSize,
                          ),
                        ),
                      )
                    ],
                  )
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

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';
// import 'package:khushal_s_application4/core/app_export.dart';
// import 'package:khushal_s_application4/model/event_model.dart';
//
// import '../../../helper/abbreviation.dart';
// import '../../../responsive/responsive_app.dart';
// import '../../../theme/custom_text_style.dart';
// import '../../event_details_screen/event_details_screen.dart';
//
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
//     bool isLargeScreen = width > 800;
//
//     double titleSmallFontSize =
//     Responsive.isSmallScreen(context) ? width / 26.0 : width / 18.0;
//     double bodyMediumFontSize =
//     Responsive.isSmallScreen(context) ? width / 30.0 : width / 15.0;
//     double headline6FontSize =
//     Responsive.isSmallScreen(context) ? width / 48.0 : width / 38.0;
//
//     if (isLargeScreen) {
//       // Adjust sizes for large screens
//       titleSmallFontSize = width / 22.0;
//       bodyMediumFontSize = width / 20.0;
//       headline6FontSize = width / 32.0;
//     }
//
//     String dateTimeString = "${widget.event.dateTime}";
//
//     DateTime dateTime = DateTime.parse(dateTimeString);
//     String formattedDay = DateFormat.E().format(dateTime);
//     String formattedDate = DateFormat.MMMd().format(dateTime);
//
//     return GestureDetector(
//       onTap: () {
//         Get.to(() => EventDetailsScreen(eventId: widget.event.id));
//       },
//       child: Container(
//         padding: EdgeInsets.symmetric(vertical: isLargeScreen ? 14.0 : 7.Sh),
//         decoration: AppDecoration.outlineBlueGrayF.copyWith(
//           borderRadius: BorderRadiusStyle.roundedBorder16,
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             Container(
//               height: isLargeScreen ? 120.Sh : 92.Sh,
//               width: isLargeScreen ? 100.Sw : 79.Sw,
//               decoration: AppDecoration.fillOrange.copyWith(
//                 borderRadius: BorderRadiusStyle.roundedBorder10,
//               ),
//               child: CustomImageView(
//                 imagePath: widget.event.bannerImage,
//                 height: isLargeScreen ? 120.Sh : 92.Sh,
//                 width: isLargeScreen ? 100.Sw : 79.Sw,
//                 fit: BoxFit.cover,
//                 radius: BorderRadius.circular(
//                   isLargeScreen ? 12.Sw : 10.Sw,
//                 ),
//                 alignment: Alignment.center,
//               ),
//             ),
//             Container(
//               margin: EdgeInsets.only(
//                 left: isLargeScreen ? 15.Sw : 10.Sw,
//                 top: isLargeScreen ? 5.Sh : 3.Sh,
//                 bottom: isLargeScreen ? 6.Sh : 4.Sh,
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     children: [
//                       Padding(
//                         padding: EdgeInsets.only(
//                             right: isLargeScreen ? 8.Sw : 5.Sw),
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
//                         padding: EdgeInsets.only(
//                             right: isLargeScreen ? 8.Sw : 5.Sw),
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
//                         padding: EdgeInsets.only(
//                             left: 2.Sw, right: isLargeScreen ? 8.Sw : 5.Sw),
//                         child: Icon(
//                           Icons.circle,
//                           size: isLargeScreen ? 6 : 5,
//                           color: Colors.blueAccent,
//                         ),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.only(
//                             right: isLargeScreen ? 8.Sw : 5.Sw),
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
//                   Padding(
//                     padding: EdgeInsets.only(
//                         top: isLargeScreen ? 8 : 3),
//                     child: Container(
//                       child: Text(
//                         widget.event.title,
//                         maxLines: isLargeScreen ? 2 : 1,
//                         overflow: TextOverflow.ellipsis,
//                         style: theme.textTheme.titleSmall?.copyWith(
//                           fontSize: titleSmallFontSize,
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: isLargeScreen ? 16.Sh : 9.Sh),
//                   Row(
//                     children: [
//                       Container(
//                         child: Icon(
//                           Icons.location_on_rounded,
//                           size: isLargeScreen ? 16 : 12,
//                           color: Colors.grey,
//                         ),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.only(
//                             left: 2.Sw, right: isLargeScreen ? 10.Sw : 3.Sw),
//                         child: Container(
//                           child: Text(
//                             widget.event.ShenueName,
//                             style: CustomTextStyles.titleMediumGray60010.copyWith(
//                               fontSize: headline6FontSize,
//                             ),
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.only(
//                             left: 2.Sw, right: isLargeScreen ? 6.Sw : 2.Sw),
//                         child: Icon(
//                           Icons.circle,
//                           size: isLargeScreen ? 8 : 4,
//                           color: Colors.grey,
//                         ),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.only(
//                             right: isLargeScreen ? 6.Sw : 2.Sw),
//                         child: Container(
//                           child: Text(
//                             "${widget.event.ShenueCity},",
//                             style: CustomTextStyles.titleMediumGray60010.copyWith(
//                               fontSize: headline6FontSize,
//                             ),
//                           ),
//                         ),
//                       ),
//                       Container(
//                         child: Text(
//                           CountryAbbreviationHelper.getAbbreviation(
//                               widget.event.ShenueCountry),
//                           style: CustomTextStyles.titleMediumGray60010.copyWith(
//                             fontSize: headline6FontSize,
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
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
//     return "${dateTime.Swour}:${dateTime.minute} ${dateTime.Swour >= 12 ? 'PM' : 'AM'}";
//   }
// }




