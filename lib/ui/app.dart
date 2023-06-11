import 'package:appdeli/feactures/presentacion/tabs/home_tabs/home_tabs.dart';
import 'package:appdeli/ui/auth/editar_perfil.dart';
import 'package:appdeli/ui/auth/perfil.dart';
import 'package:appdeli/ui/auth/reset_password.dart';

import 'package:appdeli/ui/auth/welcome.dart';

import 'package:appdeli/ui/auth/login.dart';

import 'package:appdeli/ui/auth/register.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Delicias Rosmi',
      theme: ThemeData.light(),
      initialRoute: '/welcome',
      routes: {
        "/login": (context) => Login(),
        "/register": (context) => Register(),
        "/Editar_perfil": (context) => Perfil(),
        "/welcome": (context) => Welcome(),
        "/TabsPages": (context) => TabsPages(),
        "/home_tabs": (context) => HomeTabs(),
        "/reset_password": (context) => ForgoPassword(),
        "/perfil": (context) => ProfileTabs(),
      },
    );
  }
}
