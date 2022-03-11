
import 'package:ai_score/provider/category_screen_provider.dart';
import 'package:ai_score/provider/login_provider.dart';
import 'package:ai_score/helper/save_token.dart';
import 'package:ai_score/provider/score_analytics_provider.dart';
import 'package:ai_score/provider/signup_provider.dart';
import 'package:ai_score/provider/smile_screen_provider.dart';
import 'package:ai_score/services/api.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;
void setUpLocator() {
  locator.registerLazySingleton(() => Api());
  locator.registerLazySingleton<SaveToken>(() => SaveToken());
  locator.registerFactory(() => LoginProvider());
  locator.registerFactory(() => SignUpProvider());
  locator.registerFactory(() => ScoreAnalyticsProvider());
  locator.registerFactory(() => SmileScreenProvider());
  locator.registerFactory(() => CategoryScreenProvider());


  locator.registerLazySingleton<Dio>(() {
    Dio dio = Dio();
    //dio.interceptors.add(AuthInterceptor());
    dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
    // dio.interceptors.add(AuthInterceptor());
    return dio;
  });
}
