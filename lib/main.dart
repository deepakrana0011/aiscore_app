import 'package:camera/camera.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'constants/route_constants.dart';
import 'helper/shared_pref.dart';
import 'locator.dart';
import 'router.dart' as router;

List<CameraDescription>? cameras;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  SharedPref.prefs = await SharedPreferences.getInstance();
  cameras = await availableCameras();
  runApp(
    EasyLocalization(
        path: 'langs',
        supportedLocales: const [
          Locale('en'),
        ],
        fallbackLocale: const Locale('en'),
        child: const MyApp()),
  );

  setUpLocator();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: () => MaterialApp(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          debugShowCheckedModeBanner: false,
          title: "Dog App",
          onGenerateRoute: router.Router.generateRoute,
          initialRoute: SharedPref.prefs?.getString(SharedPref.TOKEN) == null
              ? RoutesConstants.logInScreen
              : RoutesConstants.scoreAnalytics,
          builder: (context, widget) {
            ScreenUtil.setContext(context);
            return MediaQuery(
              //Setting fonts does not change with system fonts size
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: widget!,
            );
          }),
    );
  }
}
