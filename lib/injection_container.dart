import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:navigator_test/app_config.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/navigation_feature/injection_container.dart';

final sl = GetIt.instance;

const globalDio = 'global';

class InjectionContainer extends Injector with NewFeatureInjector {}

abstract class Injector {
  @mustCallSuper
  Future<void> init() async {
    sl.registerLazySingleton<AppConfig>(() => AppConfig.init);
    sl.registerLazySingleton<Dio>(
      () {
        final dio = Dio(BaseOptions(
          baseUrl: sl<AppConfig>().api,
          connectTimeout: 15000,
          receiveTimeout: 15000,
        ));
        dio
          ..options.headers = {"content-type": "application/json", "Accept": "application/json"}
          ..interceptors.add(LogInterceptor(
            responseBody: true,
            requestBody: true,
            requestHeader: true,
            responseHeader: true,
            request: true,
          ));
        return dio;
      },
      instanceName: globalDio,
    );

    final sharedPreferences = await SharedPreferences.getInstance();
    sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  }
}
