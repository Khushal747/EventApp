
import 'package:flutter/material.dart' hide SearchController;
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:khushal_s_application4/core/app_export.dart';
import 'package:khushal_s_application4/core/utils/size_ext.dart';

import '../../../model/search_event_model.dart';
import '../../event_details_screen/event_details_screen.dart';

class SearchlistItemWidget extends StatelessWidget {
  final SearchedEvent eventId;

  const SearchlistItemWidget({Key? key, required this.eventId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    bool isLargeScreen = width > 800;

    String dateTimeString = "${eventId.dateTime}";
    DateTime dateTime = DateTime.parse(dateTimeString);
    String formattedDay = DateFormat.E().format(dateTime);
    String formattedDate = DateFormat.MMMd().format(dateTime);

    return GestureDetector(
      onTap: () {
        Get.to(() => EventDetailsScreen(eventId: eventId.id));
      },
        child: Container(
        padding: EdgeInsets.all(isLargeScreen ? 15.0 : 10.0),
        decoration: AppDecoration.outlineOnPrimaryContainer.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder16,
        ),
        child: Row(
          children: [
            Card(
              clipBehavior: Clip.antiAlias,
              elevation: 0,
              margin: EdgeInsets.all(0),
              color: appTheme.orange200,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusStyle.roundedBorder10,
              ),
              child: Container(
                height: isLargeScreen ? 120.Sh : 92.Sh,
                width: isLargeScreen ? 100.Sw : 79.Sw,
                decoration: AppDecoration.fillOrange.copyWith(
                  borderRadius: BorderRadiusStyle.roundedBorder10,
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        height: isLargeScreen ? 120.Sh : 92.Sh,
                        width: isLargeScreen ? 100.Sw : 79.Sw,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            CustomImageView(
                              fit: BoxFit.cover,
                              imagePath: eventId.bannerImage,
                              height: isLargeScreen ? 120.Sh : 92.Sh,
                              width: isLargeScreen ? 100.Sw : 79.Sw,
                              radius: BorderRadius.circular(
                                isLargeScreen ? 12.Sw : 10.Sw,
                              ),
                              alignment: Alignment.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: isLargeScreen ? 20.Sw : 18.Sw,
                top: isLargeScreen ? 16.Sh : 12.Sh,
                bottom: isLargeScreen ? 12.Sh : 9.Sh,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    formattedDate + " - " + formattedDay + " - " + "${formatTime(dateTime)}",
                    style: theme.textTheme.labelLarge,
                  ),
                  SizedBox(height: isLargeScreen ? 6.Sh : 3.Sh),
                  SizedBox(
                    width: isLargeScreen ? 223.Sw : 167.Sw,
                    child: Text(
                      eventId.title,
                      maxLines: isLargeScreen ? 3 : 2,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.titleMedium!.copyWith(
                        height: 1.39,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String formatTime(DateTime dateTime) {
    return "${dateTime.hour}:${dateTime.minute} ${dateTime.hour >= 12 ? 'PM' : 'AM'}";
  }
}
