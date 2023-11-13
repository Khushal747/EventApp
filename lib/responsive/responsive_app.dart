import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget largeScreen;
  final smallScreen;

   Responsive({Key? key,
     required this.largeScreen,
     this.smallScreen}):
      super(key:key);

   static bool isSmallScreen(BuildContext context){
return MediaQuery.of(context).size.width<800;

   }

   static bool isLargeScreen(BuildContext context){
     return MediaQuery.of(context).size.width>=800 && MediaQuery.of(context).size.width<=1200;
   }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context,constraints)
    {
      if(constraints.maxWidth>=800){
        return largeScreen;
      }
      else {
        return smallScreen;
      }
    }
    );
  }
}
