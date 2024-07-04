import "dart:ui";

import "package:firebase_core/firebase_core.dart";
import "package:firebase_crashlytics/firebase_crashlytics.dart";
import "package:flutter/cupertino.dart";
import "package:l/l.dart";

import "src/common/local/app_storage.dart";


Future<void> setup() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FlutterError.onError = (FlutterErrorDetails errorDetails) {
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };
  PlatformDispatcher.instance.onError = (Object error, StackTrace stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };
  await getStorageValues();
}

String? token;

Future<void> getStorageValues() async {
  token = await AppStorage.$read(key: StorageKey.user);
  l.w(token ?? "------\n------------\n-----------\n-------" " ====================================");
}


