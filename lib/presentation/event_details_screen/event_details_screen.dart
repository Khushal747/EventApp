
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:khushal_s_application4/core/app_export.dart';
import 'package:khushal_s_application4/core/utils/size_ext.dart';
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
  String? imagePath;
  @override
  void initState() {
    super.initState();
    imagePath=ImageConstant.imgBookmark;
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
              SizedBox(height: 20.Sh),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: isLargeScreen ? 600.Sw : double.maxFinite,
                        margin: EdgeInsets.only(
                          left: isLargeScreen ? 40.Sw : 23.Sw,
                          right: isLargeScreen ? 40.Sw : 51.Sw,
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
                      SizedBox(height: isLargeScreen ? 20.Sh : 15.Sh),
                      Padding(
                        padding: EdgeInsets.only(
                          left: isLargeScreen ? 35.Sw : 22.Sw,
                        ),
                        child: Row(
                          children: [
                            CustomImageView(
                              imagePath: ImageConstant.imgTifIcon1,
                              height: 51.Sh,
                              width: isLargeScreen ? 54.Sw : 40.Sw,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: isLargeScreen ? 12.Sw : 8.Sw,
                                top: isLargeScreen ? 8.Sh : 8.Sh,
                                bottom: isLargeScreen ? 4.Sh : 4.Sh,
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
                                  SizedBox(height: isLargeScreen ? 5.Sh : 5.Sh),
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
                      SizedBox(height: isLargeScreen ? 27.Sh : 27.Sh),
                      Padding(
                        padding: EdgeInsets.only(
                          left: isLargeScreen ? 40.Sw : 23.Sw,
                        ),
                        child: Row(
                          children: [
                            Container(
                              padding:
                                  EdgeInsets.all(isLargeScreen ? 16.Sw : 9.Sw),
                              height:
                                  isLargeScreen ? 80.Sh : 48.Sh,
                              width:
                                  isLargeScreen ? 80.Sw : 48.Sw,
                              decoration: BoxDecoration(
                                color: Color(0xFFE6F5FF),
                                borderRadius: BorderRadius.circular(
                                  isLargeScreen ? 20.Sw : 12.Sw,
                                ),
                              ),
                              child: CustomImageView(
                                imagePath: ImageConstant.imgCalendar,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: isLargeScreen ? 30.Sw : 14.Sw,
                                top: isLargeScreen ? 16.Sh : 2.Sh,
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
                                  SizedBox(height: isLargeScreen ? 8.Sh : 8.Sh),
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
                      SizedBox(height: isLargeScreen ? 24.Sh : 24.Sh),
                      Padding(
                        padding: EdgeInsets.only(
                          left: isLargeScreen ? 40.Sw : 23.Sw,
                        ),
                        child: Row(
                          children: [
                            Container(
                              padding:
                                  EdgeInsets.all(isLargeScreen ? 16.Sw : 9.Sw),
                              height:
                                  isLargeScreen ? 80.Sh : 48.Sh,
                              width:
                                  isLargeScreen ? 80.Sw : 48.Sw,
                              decoration: BoxDecoration(
                                color: Color(0xFFE6F5FF),
                                borderRadius: BorderRadius.circular(
                                  isLargeScreen ? 20.Sw : 12.Sw,
                                ),
                              ),
                              child: CustomImageView(
                                imagePath: ImageConstant.imgLocation,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: isLargeScreen ? 30.Sw : 14.Sw,
                                top: isLargeScreen ? 16.Sh : 2.Sh,
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
                                  SizedBox(height: isLargeScreen ? 10.Sh : 10.Sh),
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
                      SizedBox(height: isLargeScreen ? 39.Sh : 39.Sh),
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
      height: isLargeScreen ? 300.Sh : 177.Sh,
      width: double.maxFinite,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          CustomImageView(
            imagePath: _eventDetail?.bannerImage,
            fit: BoxFit.cover,
            height: isLargeScreen ? 300.Sh : 177.Sh,
            width: isLargeScreen ? 800.Sw : 375.Sw,
            alignment: Alignment.center,
          ),
          CustomAppBar(
            height: isLargeScreen ? 80.Sh : 50.Sh,
            leadingWidth: 46.Sw,
            leading: AppbarLeadingImage(
              imagePath: ImageConstant.imgArrowLeft,
              margin: EdgeInsets.only(
                left: isLargeScreen ? 40.Sw : 24.Sw,
                top: isLargeScreen ? 8.Sh : 8.Sh,
                bottom: isLargeScreen ? 20.Sh : 20.Sh,
              ),
              onTap: () {
                onTapArrowLeft(context);
              },
            ),
            title: AppbarTitle(
              text: "Event Details",
              margin: EdgeInsets.only(left: isLargeScreen ? 20.Sw : 13.Sw),
            ),
            actions: [
              Container(
                margin: EdgeInsets.only(
                  left: isLargeScreen ? 25.Sw : 25.Sw,
                  right: isLargeScreen ? 25.Sw : 25.Sw,
                  top: isLargeScreen ? 15.Sh : 5.Sh,
                ),
                padding: EdgeInsets.all(isLargeScreen ? 20.Sw : 10.Sw),
                decoration: AppDecoration.fillPrimaryContainer1.copyWith(
                  borderRadius: BorderRadiusStyle.roundedBorder10,
                ),
                child: Column(
                  children: [
                    SizedBox(height: isLargeScreen ? 2.Sh : 1.Sh),
                    // AppbarImage(
                    //   onTap: (){
                    //
                    //   },
                    //   imagePath: ImageConstant.
                    //   // imgBookmark,
                    //    imgBookmarkSBlue,
                    //   // ImageConstant.imgBookmark,
                    // ),
                    AppbarImage(
                      key: UniqueKey(), // Add a unique key to force reload on image path change
                      onTap: () {
                        setState(() {
                          // Toggle the image path
                          imagePath = (imagePath == ImageConstant.imgBookmark)
                              ? ImageConstant.imgBookmarkSBlue
                              : ImageConstant.imgBookmark;

                        });
                      },
                      imagePath: imagePath,
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
    bool _isExpanded = false;

    return SizedBox(
      height: isLargeScreen ? 300.Sh : 236.Sh,
      width: double.maxFinite,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: isLargeScreen ? 100.Sh : 92.Sh,
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
                left: isLargeScreen ? 60.Sw : 40.Sw,
                right: isLargeScreen ? 80.Sw : 24.Sw,
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
                  SizedBox(height: isLargeScreen ? 17.Sh : 17.Sh),
                  SizedBox(
                    width: isLargeScreen ? 600.Sw : 330.Sw,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          // Toggle the expanded state
                          _isExpanded = !_isExpanded;
                        });
                      },
                      child: ReadMoreText(
                        _eventDetail!.description,
                        trimLines: 5,
                        trimMode: TrimMode.Line,
                        trimCollapsedText: 'Read More',
                        trimExpandedText: 'Read Less',
                        style: CustomTextStyles.bodyLargeGray900_1,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(bottom: isLargeScreen ? 2.Sh : 2.Sh),
              padding: EdgeInsets.symmetric(
                horizontal: isLargeScreen ? 100.Sw : 52.Sw,
                vertical: isLargeScreen ? 30.Sh : 23.Sh,
              ),
              decoration:
                  AppDecoration.gradientPrimaryContainerToPrimaryContainer,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(height: isLargeScreen ? 100.Sh : 77.Sh),
                  CustomElevatedButton(
                    text: "BOOK NOW".toUpperCase(),
                    rightIcon: Container(
                      padding: EdgeInsets.fromLTRB(8.Sw, 8.Sh, 9.Sw, 9.Sh),
                      margin:
                          EdgeInsets.only(left: isLargeScreen ? 60.Sw : 30.Sw),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary,
                        borderRadius:
                            BorderRadius.circular(isLargeScreen ? 30.Sw : 15.Sw),
                      ),
                      child: CustomImageView(
                        imagePath: ImageConstant.imgShape,
                        height: isLargeScreen ? 20.Sh : 13.Sh,
                        width: isLargeScreen ? 20.Sw : 13.Sw,
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
