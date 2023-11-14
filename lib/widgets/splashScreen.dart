
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khushal_s_application4/core/utils/size_ext.dart';

import '../core/utils/size_utils.dart';
import '../presentation/home_screen/home_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    checkLoggedInUser();
  }

  void checkLoggedInUser() async {
    await Future.delayed(Duration(seconds: 2));

      Get.offAll(() => HomeScreen());

  }

  @override
  Widget build(BuildContext context) {
    Util.deviceHeight = MediaQuery.of(context).size.height;
    Util.deviceWidth = MediaQuery.of(context).size.width;
    print("DeviceHeight->");
    print(Util.deviceHeight);
    print("deviceWidth->");
    print( Util.deviceWidth);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: 1.Sh,
        width: 1.Sw,

        decoration:  BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/placard.png'

            ),

            fit: BoxFit.fitHeight,
          ),
        ),
      ),
    );
  }
}
