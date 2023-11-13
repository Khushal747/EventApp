
import '../../api/search_api_service.dart';
import '../../model/search_event_model.dart';
import '../search_screen/widgets/searchlist_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:khushal_s_application4/core/app_export.dart';
import 'package:khushal_s_application4/widgets/app_bar/appbar_leading_image.dart';
import 'package:khushal_s_application4/widgets/app_bar/appbar_subtitle.dart';
import 'package:khushal_s_application4/widgets/app_bar/custom_app_bar.dart';
import 'package:khushal_s_application4/widgets/custom_text_form_field.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  SearchEventService searchEventService = SearchEventService();
  SearchEventModel? _searchEventModel;

  TextEditingController nameController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      fetchSearchResults();
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    bool isLargeScreen = width > 800;

    return Scaffold(
      body: _searchEventModel != null
          ? buildSearchScreen(isLargeScreen)
          : buildLoadingScreen(),
    );
  }

  Widget buildSearchScreen(bool isLargeScreen) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(context),
        body: Form(
          key: _formKey,
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: isLargeScreen ? 35.0 : 21.0, vertical: isLargeScreen ? 30.0 : 17.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: isLargeScreen ? 20.0 : 11.0),
                Padding(
                  padding: EdgeInsets.only(left: isLargeScreen ? 5.0 : 3.0),
                  child: CustomTextFormField(
                    width: isLargeScreen ? 340.0 : 250.0,
                    controller: nameController,
                    hintText: "Type Event Name",
                    textInputAction: TextInputAction.done,
                    onChanged: (text) {
                      fetchSearchResults();
                    },
                    prefix: Container(
                      margin: EdgeInsets.only(
                        top: isLargeScreen ? 3.0 : 2.0,
                        right: isLargeScreen ? 40.0 : 23.0,
                        bottom: isLargeScreen ? 2.0 : 1.0,
                      ),
                      child: CustomImageView(
                        imagePath: ImageConstant.imgSearchOnerror,
                        height: isLargeScreen ? 32.0 : 24.0,
                        width: isLargeScreen ? 32.0 : 24.0,
                      ),
                    ),
                    prefixConstraints: BoxConstraints(maxHeight: isLargeScreen ? 36.0 : 27.0),
                  ),
                ),
                SizedBox(height: isLargeScreen ? 60.0 : 31.0),
                _buildSearchList(context, isLargeScreen),
              ],
            ),
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

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      height: 38.0,
      leadingWidth: 46.0,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgArrowLeftGray900,
        margin: EdgeInsets.only(left: 24.0, top: 9.0, bottom: 7.0),
        onTap: () {
          onTapArrowLeft(context);
        },
      ),
      title: AppbarSubtitle(
        text: "Search",
        margin: EdgeInsets.only(left: 11.0),
      ),
    );
  }

  Widget _buildSearchList(BuildContext context, bool isLargeScreen) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(right: isLargeScreen ? 12.0 : 6.0),
        child: _searchEventModel != null
            ? ListView.separated(
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (context, index) {
            return SizedBox(height: isLargeScreen ? 32.0 : 16.0);
          },
          itemCount: _searchEventModel!.data.length,
          itemBuilder: (context, index) {
            return SearchlistItemWidget(
              eventId: _searchEventModel!.data[index],
            );
          },
        )
            : CircularProgressIndicator(),
      ),
    );
  }

  void onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }

  Future<void> fetchSearchResults() async {
    try {
      _searchEventModel = await searchEventService.searchEvents(
        nameController.text,
        'https://sde-007.api.assignment.theinternetfolks.works',
      );
      if (mounted) {
        setState(() {});
      }
    } catch (e) {
      print('Error fetching search results: $e');
    }
  }
}
