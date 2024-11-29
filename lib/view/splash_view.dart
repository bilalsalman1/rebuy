import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rebuyy/constant/reusable_constant.dart';
import 'package:rebuyy/controllers/splash_controller.dart';
import 'package:rebuyy/utils/appcolors.dart';

class SplashView extends StatelessWidget {
  SplashView({super.key});

  final SplashController splashController = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          backgroundColor.DarkShade,
          backgroundColor.LightShade,
        ])),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: CircleAvatar(
                  backgroundColor: Appcolors.lightgrey,
                  radius: 70,
                  child: ReusableText(
                      text: 'ReBuy',
                      sized: 32,
                      fontWeight: FontWeight.w800,
                      colors: Appcolors.darkGrey,
                      textAlign: TextAlign.center)),
            )
          ],
        ),
      ),
    );
  }
}
