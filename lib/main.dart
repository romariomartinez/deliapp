import 'package:appdeli/feactures/domain/controller/controllerPerfilFirebase.dart';
import 'package:appdeli/feactures/domain/controller/controllerUserFirebase.dart';
import 'package:appdeli/ui/app.dart';
import 'package:appdeli/ui/providers/app_providers2.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'ui/providers/app_providers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GetPlatform.isWeb
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
              apiKey: "AIzaSyD-5NpwIl13rzYFEkFVUNk21mgL9wR1aw0",
              authDomain: "appdeli-0809.firebaseapp.com",
              projectId: "appdeli-0809",
              storageBucket: "appdeli-0809.appspot.com",
              messagingSenderId: "968169853485",
              appId: "1:968169853485:web:1ac9cf6f147fd888831ea4"))
      : await Firebase.initializeApp();

  Get.put(ControlUserAuth());
  Get.put(ControlUserPerfil());
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => AppProvider()),
      ChangeNotifierProvider(create: (_) => AppProvider2())],
    
    child: const App(),
  ));
}
