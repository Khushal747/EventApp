// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:khushal_s_application4/core/app_export.dart';
// import 'package:khushal_s_application4/widgets/app_bar/appbar_image.dart';
// import 'package:khushal_s_application4/widgets/app_bar/appbar_leading_image.dart';
// import 'package:khushal_s_application4/widgets/app_bar/appbar_title.dart';
// import 'package:khushal_s_application4/widgets/app_bar/custom_app_bar.dart';
// import 'package:khushal_s_application4/widgets/custom_elevated_button.dart';
// import 'package:khushal_s_application4/widgets/custom_icon_button.dart';
// import 'package:provider/provider.dart';
// import 'package:readmore/readmore.dart';
//
// import '../../api/event_detail_api.dart';
// import '../../helper/abbreviation.dart';
// import '../../model/event_detail_model.dart';
// import '../../theme/theme_helper.dart';
// import '../../theme/theme_helper.dart';
//
// class EventDetailsScreen extends StatefulWidget {
//   final int eventId;
//
//   EventDetailsScreen({Key? key, required this.eventId}) : super(key: key);
//
//   @override
//   State<EventDetailsScreen> createState() => _EventDetailsScreenState();
// }
//
// class _EventDetailsScreenState extends State<EventDetailsScreen> {
//   EventDetail? _eventDetail;
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       fetchEventDetails(widget.eventId);
//     });
//     print("eventId->${widget.eventId}");
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     mediaQueryData = MediaQuery.of(context);
//
//     return SafeArea(
//       child: Scaffold(
//         body:
//             // buildEventDetailsScreen(),
//             _eventDetail != null
//                 ? buildEventDetailsScreen()
//                 : buildLoadingScreen(),
//       ),
//     );
//   }
//
//   Widget buildEventDetailsScreen() {
//     String dateTimeString = "${_eventDetail!.dateTime}";
//
//     DateTime dateTime = DateTime.parse(dateTimeString);
//
//     String formattedDay = DateFormat('EEEE').format(dateTime);
//     String formattedDate = DateFormat.MMMd().format(dateTime); // Abbreviated month and day (e.g., Apr 12)
//
//     return SafeArea(
//         child: Scaffold(
//             body: SizedBox(
//                 width: double.maxFinite,
//                 child: Column(children: [
//                   _buildStackThree(context),
//                   SizedBox(height: 20.v),
//                   Expanded(
//                       child: SingleChildScrollView(
//                           child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                         Container(
//                             width: 299.h,
//                             margin: EdgeInsets.only(left: 23.h, right: 51.h),
//                             child: Text(_eventDetail!.title,
//                                 maxLines: 2,
//                                 overflow: TextOverflow.ellipsis,
//                                 style: theme.textTheme.displaySmall)),
//                         SizedBox(height: 15.v),
//                         Padding(
//                             padding: EdgeInsets.only(left: 22.h),
//                             child: Row(children: [
//                               CustomImageView(
//                                   imagePath: ImageConstant.imgTifIcon1,
//                                   height: 51.v,
//                                   width: 54.h),
//                               Padding(
//                                   padding: EdgeInsets.only(
//                                       left: 8.h, top: 8.v, bottom: 4.v),
//                                   child: Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         Text(_eventDetail!.organiserName,
//                                             style: CustomTextStyles
//                                                 .bodyMediumOnPrimary),
//                                         SizedBox(height: 5.v),
//                                         Text(_eventDetail!.organiserName,
//                                             style: CustomTextStyles
//                                                 .bodySmallBluegray500)
//                                       ]))
//                             ])),
//                         SizedBox(height: 27.v),
//                         Padding(
//                             padding: EdgeInsets.only(left: 23.h),
//                             child: Row(children: [
//                               Container(
//                                 padding: EdgeInsets.all(9.h),
//                                 height: 48.adaptSize,
//                                 width: 48.adaptSize,
//                                 decoration: BoxDecoration(
//                                   color:Color(0xFFE6F5FF),
//                                   // theme.colorScheme.onError,
//                                   borderRadius: BorderRadius.circular(12.h),
//                                 ),
//                                 child:  CustomImageView(
//                                     imagePath:ImageConstant.imgCalendar
//                                     // 'assets/images/img_calendar.svg'
//                                           // ImageConstant.imgCalendar
//                                         ),
//                               ),
//
//                               Padding(
//                                   padding:
//                                       EdgeInsets.only(left: 14.h, top: 3.v),
//                                   child: Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         Opacity(
//                                             opacity: 0.84,
//                                             child: Text( "$formattedDate,2021",
//                                                 style: CustomTextStyles
//                                                     .titleMediumGray90016)),
//                                         SizedBox(height: 8.v),
//                                         Text("$formattedDay,${formatTime(_eventDetail!.dateTime)} - 9:00 PM",
//                                             style: theme.textTheme.bodySmall)
//                                       ]))
//                             ])),
//                         SizedBox(height: 24.v),
//                         Padding(
//                             padding: EdgeInsets.only(left: 23.h),
//                             child: Row(children: [
//                               Container(
//                                 padding: EdgeInsets.all(9.h),
//                                 height: 48.adaptSize,
//                                 width: 48.adaptSize,
//                                 decoration: BoxDecoration(
//                                   color:Color(0xFFE6F5FF),
//                                   // theme.colorScheme.onError,
//                                   borderRadius: BorderRadius.circular(12.h),
//                                 ),
//                                 child:  CustomImageView(
//                                     imagePath:ImageConstant.imgLocation,
//                                 ),
//                               ),
//                               Padding(
//                                   padding:
//                                       EdgeInsets.only(left: 14.h, top: 2.v),
//                                   child: Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         Opacity(
//                                             opacity: 0.84,
//                                             child: Text(_eventDetail!.venueName,
//                                                 style: CustomTextStyles
//                                                     .titleMediumGray90016)),
//                                         SizedBox(height: 10.v),
//                                         Text(
//                                             _eventDetail!.venueCity +
//                                                 "," +
//                                                 CountryAbbreviationHelper.getAbbreviation(_eventDetail!.venueCountry),
//
//                                             style: theme.textTheme.bodySmall)
//                                       ]))
//                             ])),
//                         SizedBox(height: 39.v),
//                         _buildStackTwentyOne(context)
//                       ])))
//                 ]))));
//   }
//
//   Widget buildLoadingScreen() {
//     return Center(
//       child: CircularProgressIndicator(),
//     );
//   }
//
//   /// Section Widget
//   Widget _buildStackThree(BuildContext context) {
//     return SizedBox(
//         height: 177.v,
//         width: double.maxFinite,
//         child: Stack(alignment: Alignment.topCenter, children: [
//           CustomImageView(
//               imagePath: _eventDetail?.bannerImage,
//               fit: BoxFit.cover,
//               height: 177.v,
//               width: 375.h,
//               alignment: Alignment.center),
//           CustomAppBar(
//               height: 50.v,
//               leadingWidth: 46.h,
//               leading: AppbarLeadingImage(
//                   imagePath: ImageConstant.imgArrowLeft,
//                   margin: EdgeInsets.only(left: 24.h, top: 8.v, bottom: 20.v),
//                   onTap: () {
//                     onTapArrowLeft(context);
//                   }),
//               title: AppbarTitle(
//                   text: "Event Details", margin: EdgeInsets.only(left: 13.h)),
//               actions: [
//                 Container(
//                     margin:
//                         EdgeInsets.only(left: 25.h, right: 25.h,top: 5.v),
//                     padding: EdgeInsets.all(10.h),
//                     decoration: AppDecoration.fillPrimaryContainer1.copyWith(
//                         borderRadius: BorderRadiusStyle.roundedBorder10),
//                     child: Column(children: [
//                       SizedBox(height: 1.v),
//                       AppbarImage(imagePath: ImageConstant.imgBookmark)
//                     ]
//                     )
//                 )
//               ],
//               styleType: Style
//                   .bgGradientnameblack90001opacity059nameblack90001opacity0)
//         ]));
//   }
//
//   /// Section Widget
//   Widget _buildStackTwentyOne(BuildContext context) {
//     return SizedBox(
//         height: 236.v,
//         width: double.maxFinite,
//         child: Stack(alignment: Alignment.topCenter, children: [
//           Align(
//               alignment: Alignment.bottomCenter,
//               child: Container(
//                   height: 92.v,
//                   width: double.maxFinite,
//                   decoration: BoxDecoration(
//                       gradient: LinearGradient(
//                           begin: Alignment(0.5, 0),
//                           end: Alignment(0.5, 1),
//                           colors: [
//                         theme.colorScheme.primaryContainer.withOpacity(0),
//                         theme.colorScheme.primaryContainer.withOpacity(1)
//                       ])))),
//           Align(
//               alignment: Alignment.topCenter,
//               child: Padding(
//                   padding: EdgeInsets.only(left: 20.h, right: 24.h),
//                   child: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Opacity(
//                             opacity: 0.84,
//                             child: Text("About Event",
//                                 style: CustomTextStyles.titleMediumGray900)),
//                         SizedBox(height: 17.v),
//                         SizedBox(
//                           width: 330.h,
//                           child: ReadMoreText(
//                             _eventDetail!.description,
//                             trimLines: 4,
//                             trimMode: TrimMode.Line,
//                             trimCollapsedText: 'Read More',
//                             trimExpandedText: ' Read Less',
//                             style: CustomTextStyles.bodyLargeGray900_1,
//                           ),
//
//                         )
//                       ]))),
//           Align(
//               alignment: Alignment.bottomCenter,
//               child: Container(
//                   margin: EdgeInsets.only(bottom: 2.v),
//                   padding:
//                       EdgeInsets.symmetric(horizontal: 52.h, vertical: 23.v),
//                   decoration:
//                       AppDecoration.gradientPrimaryContainerToPrimaryContainer,
//                   child: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                         SizedBox(height: 77.v),
//                         CustomElevatedButton(
//                             text: "BOOK NOW".toUpperCase(),
//                             rightIcon: Container(
//                                 padding:
//                                     EdgeInsets.fromLTRB(8.h, 8.v, 9.h, 9.v),
//                                 margin: EdgeInsets.only(left: 30.h),
//                                 decoration: BoxDecoration(
//                                     color: theme.colorScheme.primary,
//                                     borderRadius: BorderRadius.circular(15.h)),
//                                 child: CustomImageView(
//                                     imagePath: ImageConstant.imgShape,
//                                     height: 13.adaptSize,
//                                     width: 13.adaptSize)))
//                       ])))
//         ]));
//   }
//
//   /// Navigates back to the previous screen.
//   onTapArrowLeft(BuildContext context) {
//     Navigator.pop(context);
//   }
//
//   Future<void> fetchEventDetails(int eventId) async {
//     try {
//       _eventDetail = await EventDetailService().getEventDetail(
//           eventId, 'https://sde-007.api.assignment.theinternetfolks.works');
//       print('Event Detail: $_eventDetail');
//       setState(() {});
//       // Now you can use the event details in your UI or wherever needed.
//     } catch (e) {
//       print('Error fetching event details: $e');
//     }
//   }
//   String getMonthAbbreviation(int month) {
//
//     return DateTime(2023, month).toString().split(' ')[0];
//   }
//
//   String formatTime(DateTime dateTime) {
//     return "${dateTime.hour}:${dateTime.minute} ${dateTime.hour >= 12 ? 'PM' : 'AM'}";
//   }
// }

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:khushal_s_application4/core/app_export.dart';
import 'package:khushal_s_application4/widgets/app_bar/appbar_image.dart';
import 'package:khushal_s_application4/widgets/app_bar/appbar_leading_image.dart';
import 'package:khushal_s_application4/widgets/app_bar/appbar_title.dart';
import 'package:khushal_s_application4/widgets/app_bar/custom_app_bar.dart';
import 'package:khushal_s_application4/widgets/custom_elevated_button.dart';
import 'package:khushal_s_application4/widgets/custom_icon_button.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';

import '../../api/event_detail_api.dart';
import '../../helper/abbreviation.dart';
import '../../model/event_detail_model.dart';
import '../../responsive/responsive_app.dart';
import '../../theme/theme_helper.dart';
import '../../theme/theme_helper.dart';

class EventDetailsScreen extends StatefulWidget {
  final int eventId;

  EventDetailsScreen({Key? key, required this.eventId}) : super(key: key);

  @override
  State<EventDetailsScreen> createState() => _EventDetailsScreenState();
}

class _EventDetailsScreenState extends State<EventDetailsScreen> {
  EventDetail? _eventDetail;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      fetchEventDetails(widget.eventId);
    });
    print("eventId->${widget.eventId}");
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    bool isLargeScreen = mediaQueryData.size.width > 800;

    return SafeArea(
      child: Scaffold(
        body: _eventDetail != null
            ? buildEventDetailsScreen(isLargeScreen)
            : buildLoadingScreen(),
      ),
    );
  }

  Widget buildEventDetailsScreen(bool isLargeScreen) {
    String dateTimeString = "${_eventDetail!.dateTime}";
    double width = MediaQuery.of(context).size.width;

    double bodyMediumOnPrimaryFontSize = Responsive.isSmallScreen(context) ? width / 26.0 : width / 18.0;
    double bodySmallBluegray500FontSize = Responsive.isSmallScreen(context) ? width / 30.0 : width / 22.0;

    DateTime dateTime = DateTime.parse(dateTimeString);

    String formattedDay = DateFormat('EEEE').format(dateTime);
    String formattedDate = DateFormat.MMMd()
        .format(dateTime); // Abbreviated month and day (e.g., Apr 12)

    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              _buildStackThree(context, isLargeScreen),
              SizedBox(height: 20.v),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: isLargeScreen ? 600.h : double.maxFinite,
                        margin: EdgeInsets.only(
                          left: isLargeScreen ? 40.h : 23.h,
                          right: isLargeScreen ? 40.h : 51.h,
                        ),
                        child: Text(
                          _eventDetail!.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: isLargeScreen
                              ? theme.textTheme.displayLarge
                              : theme.textTheme.displaySmall,
                        ),
                      ),
                      SizedBox(height: isLargeScreen ? 20.v : 15.v),
                      Padding(
                        padding: EdgeInsets.only(
                          left: isLargeScreen ? 35.h : 22.h,
                        ),
                        child: Row(
                          children: [
                            CustomImageView(
                              imagePath: ImageConstant.imgTifIcon1,
                              height: 51.v,
                              width: isLargeScreen ? 54.h : 40.h,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: isLargeScreen ? 12.h : 8.h,
                                top: isLargeScreen ? 8.v : 8.v,
                                bottom: isLargeScreen ? 4.v : 4.v,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    _eventDetail!.organiserName,
                                    style: CustomTextStyles.bodyMediumOnPrimary
                                        .copyWith(
                                      fontSize: bodyMediumOnPrimaryFontSize,
                                    ),
                                  ),
                                  SizedBox(height: isLargeScreen ? 5.v : 5.v),
                                  Text("Organizer",
                                      style: CustomTextStyles
                                          .bodySmallBluegray500.copyWith(
                                        fontSize: bodySmallBluegray500FontSize,
                                      ),),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: isLargeScreen ? 27.v : 27.v),
                      Padding(
                        padding: EdgeInsets.only(
                          left: isLargeScreen ? 40.h : 23.h,
                        ),
                        child: Row(
                          children: [
                            Container(
                              padding:
                                  EdgeInsets.all(isLargeScreen ? 16.h : 9.h),
                              height:
                                  isLargeScreen ? 80.adaptSize : 48.adaptSize,
                              width:
                                  isLargeScreen ? 80.adaptSize : 48.adaptSize,
                              decoration: BoxDecoration(
                                color: Color(0xFFE6F5FF),
                                borderRadius: BorderRadius.circular(
                                  isLargeScreen ? 20.h : 12.h,
                                ),
                              ),
                              child: CustomImageView(
                                imagePath: ImageConstant.imgCalendar,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: isLargeScreen ? 30.h : 14.h,
                                top: isLargeScreen ? 16.v : 2.v,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Opacity(
                                    opacity: 0.84,
                                    child: Text(
                                      "$formattedDate,2021",
                                      style:
                                          CustomTextStyles.titleMediumGray90016,
                                    ),
                                  ),
                                  SizedBox(height: isLargeScreen ? 8.v : 8.v),
                                  Text(
                                    "$formattedDay,${formatTime(_eventDetail!.dateTime)} - 9:00 PM",
                                    style: theme.textTheme.bodySmall,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: isLargeScreen ? 24.v : 24.v),
                      Padding(
                        padding: EdgeInsets.only(
                          left: isLargeScreen ? 40.h : 23.h,
                        ),
                        child: Row(
                          children: [
                            Container(
                              padding:
                                  EdgeInsets.all(isLargeScreen ? 16.h : 9.h),
                              height:
                                  isLargeScreen ? 80.adaptSize : 48.adaptSize,
                              width:
                                  isLargeScreen ? 80.adaptSize : 48.adaptSize,
                              decoration: BoxDecoration(
                                color: Color(0xFFE6F5FF),
                                borderRadius: BorderRadius.circular(
                                  isLargeScreen ? 20.h : 12.h,
                                ),
                              ),
                              child: CustomImageView(
                                imagePath: ImageConstant.imgLocation,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: isLargeScreen ? 30.h : 14.h,
                                top: isLargeScreen ? 16.v : 2.v,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Opacity(
                                    opacity: 0.84,
                                    child: Text(
                                      _eventDetail!.venueName,
                                      style:
                                          CustomTextStyles.titleMediumGray90016,
                                    ),
                                  ),
                                  SizedBox(height: isLargeScreen ? 10.v : 10.v),
                                  Text(
                                    "${_eventDetail!.venueCity}, ${CountryAbbreviationHelper.getAbbreviation(_eventDetail!.venueCountry)}",
                                    style: theme.textTheme.bodySmall,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: isLargeScreen ? 39.v : 39.v),
                      _buildStackTwentyOne(context, isLargeScreen),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildLoadingScreen() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildStackThree(BuildContext context, bool isLargeScreen) {
    return SizedBox(
      height: isLargeScreen ? 300.v : 177.v,
      width: double.maxFinite,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          CustomImageView(
            imagePath: _eventDetail?.bannerImage,
            fit: BoxFit.cover,
            height: isLargeScreen ? 300.v : 177.v,
            width: isLargeScreen ? 800.h : 375.h,
            alignment: Alignment.center,
          ),
          CustomAppBar(
            height: isLargeScreen ? 80.v : 50.v,
            leadingWidth: 46.h,
            leading: AppbarLeadingImage(
              imagePath: ImageConstant.imgArrowLeft,
              margin: EdgeInsets.only(
                left: isLargeScreen ? 40.h : 24.h,
                top: isLargeScreen ? 8.v : 8.v,
                bottom: isLargeScreen ? 20.v : 20.v,
              ),
              onTap: () {
                onTapArrowLeft(context);
              },
            ),
            title: AppbarTitle(
              text: "Event Details",
              margin: EdgeInsets.only(left: isLargeScreen ? 20.h : 13.h),
            ),
            actions: [
              Container(
                margin: EdgeInsets.only(
                  left: isLargeScreen ? 25.h : 25.h,
                  right: isLargeScreen ? 25.h : 25.h,
                  top: isLargeScreen ? 15.v : 5.v,
                ),
                padding: EdgeInsets.all(isLargeScreen ? 20.h : 10.h),
                decoration: AppDecoration.fillPrimaryContainer1.copyWith(
                  borderRadius: BorderRadiusStyle.roundedBorder10,
                ),
                child: Column(
                  children: [
                    SizedBox(height: isLargeScreen ? 2.v : 1.v),
                    AppbarImage(
                      imagePath: ImageConstant.imgBookmark,
                    ),
                  ],
                ),
              ),
            ],
            styleType:
                Style.bgGradientnameblack90001opacity059nameblack90001opacity0,
          ),
        ],
      ),
    );
  }

  Widget _buildStackTwentyOne(BuildContext context, bool isLargeScreen) {
    return SizedBox(
      height: isLargeScreen ? 300.v : 236.v,
      width: double.maxFinite,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: isLargeScreen ? 100.v : 92.v,
              width: double.maxFinite,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment(0.5, 0),
                  end: Alignment(0.5, 1),
                  colors: [
                    theme.colorScheme.primaryContainer.withOpacity(0),
                    theme.colorScheme.primaryContainer.withOpacity(1),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(
                left: isLargeScreen ? 60.h : 40.h,
                right: isLargeScreen ? 80.h : 24.h,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Opacity(
                    opacity: 0.84,
                    child: Text(
                      "About Event",
                      style: CustomTextStyles.titleMediumGray900,
                    ),
                  ),
                  SizedBox(height: isLargeScreen ? 17.v : 17.v),
                  SizedBox(
                    width: isLargeScreen ? 600.h : 330.h,
                    child: ReadMoreText(
                      _eventDetail!.description,
                      trimLines: 4,
                      trimMode: TrimMode.Line,
                      trimCollapsedText: 'Read More',
                      trimExpandedText: ' Read Less',
                      style: CustomTextStyles.bodyLargeGray900_1,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(bottom: isLargeScreen ? 2.v : 2.v),
              padding: EdgeInsets.symmetric(
                horizontal: isLargeScreen ? 100.h : 52.h,
                vertical: isLargeScreen ? 30.v : 23.v,
              ),
              decoration:
                  AppDecoration.gradientPrimaryContainerToPrimaryContainer,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(height: isLargeScreen ? 100.v : 77.v),
                  CustomElevatedButton(
                    text: "BOOK NOW".toUpperCase(),
                    rightIcon: Container(
                      padding: EdgeInsets.fromLTRB(8.h, 8.v, 9.h, 9.v),
                      margin:
                          EdgeInsets.only(left: isLargeScreen ? 60.h : 30.h),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary,
                        borderRadius:
                            BorderRadius.circular(isLargeScreen ? 30.h : 15.h),
                      ),
                      child: CustomImageView(
                        imagePath: ImageConstant.imgShape,
                        height: isLargeScreen ? 20.adaptSize : 13.adaptSize,
                        width: isLargeScreen ? 20.adaptSize : 13.adaptSize,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }

  Future<void> fetchEventDetails(int eventId) async {
    try {
      _eventDetail = await EventDetailService().getEventDetail(
        eventId,
        'https://sde-007.api.assignment.theinternetfolks.works',
      );
      print('Event Detail: $_eventDetail');
      setState(() {});
    } catch (e) {
      print('Error fetching event details: $e');
    }
  }

  String getMonthAbbreviation(int month) {
    return DateTime(2023, month).toString().split(' ')[0];
  }

  String formatTime(DateTime dateTime) {
    return "${dateTime.hour}:${dateTime.minute} ${dateTime.hour >= 12 ? 'PM' : 'AM'}";
  }
}
