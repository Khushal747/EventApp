import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:khushal_s_application4/widgets/config.dart';
import 'core/app_export.dart';
import 'package:khushal_s_application4/theme/theme_helper.dart';
import 'package:khushal_s_application4/routes/app_routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,

  ]);

  ///Please update theme as per your need if required.
  ThemeHelper().changeTheme('primary');
  runApp(ConfigScreen());
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: theme,
//       title: 'khushal_s_application4',
//       debugShowCheckedModeBanner: false,
//       navigatorKey: NavigatorService.navigatorKey,
//       initialRoute: AppRoutes.appNavigationScreen,
//       // homeScreen,
//       routes: AppRoutes.routes,
//     );
//   }
// }
