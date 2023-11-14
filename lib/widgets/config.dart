import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:khushal_s_application4/api/event_api_service.dart';
import 'package:khushal_s_application4/model/event_detail_model.dart';
import 'package:khushal_s_application4/presentation/home_screen/home_screen.dart';
import 'package:khushal_s_application4/widgets/splashScreen.dart';
import 'package:provider/provider.dart';
import '../api/event_detail_api.dart';
import '../api/search_api_service.dart';
import '../presentation/event_details_screen/event_details_screen.dart';
import '../theme/theme_helper.dart';
class ConfigScreen extends StatefulWidget {
  @override
  _ConfigScreenState createState() => _ConfigScreenState();
}

class _ConfigScreenState extends State<ConfigScreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ApiService()),
        ChangeNotifierProvider(create: (_) => EventDetailService()),
        ChangeNotifierProvider(create: (_) => SearchEventService()),
        // ChangeNotifierProvider(create: (_) => EventDetailsScreen()),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        theme: theme,
        home:
          // EventDetailsScreen(),
        SplashScreen(),
        // navigatorKey: navigatorKey,
      ),
    );
  }
}
