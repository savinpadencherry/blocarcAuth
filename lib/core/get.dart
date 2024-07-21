import 'package:fhirpat/core/repository/fhirpat_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:fhirpat/core/repository/auth_repository.dart';
import 'package:fhirpat/core/repository/storage_repository.dart';
import 'package:fhirpat/core/services/httpservice.dart';
import 'dart:developer' as dev;

import 'package:fhirpat/core/services/navigator_service.dart';

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
  app.registerLazySingleton(
    () => FhirRepository(),
  );
}
