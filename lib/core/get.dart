import 'package:get_it/get_it.dart';
import 'package:journey/core/repository/auth_repository.dart';
import 'package:journey/core/repository/storage_repository.dart';
import 'package:journey/core/services/httpservice.dart';
import 'dart:developer' as dev;

import 'package:journey/core/services/navigator_service.dart';

GetIt get app => GetIt.instance;
void initializeGetIt() {
  dev.log("Initiailizing get it", name: "Get.dart");
  app.registerLazySingleton(
    () => NavigatorService(),
  );
  app.registerLazySingleton(
    () => HttpService(),
  );
  app.registerLazySingleton(
    () => AuthRepository(),
  );
  app.registerLazySingleton(
    () => StorageRepository(),
  );
}
