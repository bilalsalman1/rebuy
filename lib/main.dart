import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rebuyy/controllers/register_controller.dart';
import 'package:rebuyy/firebase_options.dart';
import 'package:rebuyy/view/account_view.dart';
import 'package:rebuyy/view/home_view.dart';
import 'package:rebuyy/view/register_view.dart';
import 'package:rebuyy/view/splash_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Get.lazyPut((() => RegisterController()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashView(),
      // initialRoute: '/SplashView',
      getPages: [
        GetPage(name: '/SplashView', page: () => SplashView()),
        GetPage(name: '/RegisterView', page: () => RegisterView()),
        GetPage(name: '/HomeView', page: () => HomeView()),
        GetPage(name: '/accontview', page: () => AccountView()),
      ],
    );
  }
}
