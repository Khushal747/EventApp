
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: 1,
        width: 1,

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
