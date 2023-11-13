import 'package:get/get.dart';
import 'package:khushal_s_application4/presentation/search_screen/search_screen.dart';
import 'package:provider/provider.dart';

import '../../api/event_api_service.dart';
import '../../model/event_detail_model.dart';
import '../event_details_screen/event_details_screen.dart';
import '../home_screen/widgets/home_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:khushal_s_application4/core/app_export.dart';
import 'package:khushal_s_application4/widgets/app_bar/appbar_subtitle.dart';
import 'package:khushal_s_application4/widgets/app_bar/appbar_trailing_image.dart';
import 'package:khushal_s_application4/widgets/app_bar/custom_app_bar.dart';
import 'package:khushal_s_application4/model/event_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Event> events = [];

  @override
  void initState() {
    _fetchEventData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    bool isLargeScreen = width > 800;

    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: isLargeScreen ? 48.0 : 24.0,
            vertical: isLargeScreen ? 36.0 : 23.0,
          ),
          child: ListView.separated(
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (
                context,
                index,
                ) {
              return SizedBox(
                height: isLargeScreen ? 24.0 : 12.0,
              );
            },
            itemCount: events.length,
            itemBuilder: (context, index) {
              return HomeItemWidget(event: events[index]);
            },
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      title: AppbarSubtitle(
        text: "Events",
        margin: EdgeInsets.only(left: 31.0),
      ),
      actions: [
        AppbarTrailingImage(
          onTap: () {
            Get.to(() => SearchScreen());
          },
          imagePath: ImageConstant.imgSearch,
          margin: EdgeInsets.only(
            left: 24.0,
            top: 9.0,
            right: 3.0,
          ),
        ),
        AppbarTrailingImage(
          imagePath: ImageConstant.imgOverflowMenu,
          margin: EdgeInsets.fromLTRB(16.0, 9.0, 27.0, 2.0),
        ),
      ],
    );
  }

  Future<void> _fetchEventData() async {
    try {
      // Initialize your ApiService with the appropriate base URL
      ApiService apiService = ApiService();
      // Call the API to get events
      List<Event> fetchedEvents =
      await apiService.getAllEvents("https://sde-007.api.assignment.theinternetfolks.works");
      // Update the state with the fetched events
      setState(() {
        events = fetchedEvents;
      });
    } catch (e) {
      print('Error fetching events: $e');
    }
  }
}
