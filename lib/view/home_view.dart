import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rebuyy/constant/reusable_constant.dart';
import 'package:rebuyy/utils/appcolors.dart';
import 'package:rebuyy/view/account_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.lightgrey,
      body: Padding(
        padding: const EdgeInsets.only(top: 35),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.to(() => AccountView());
                  },
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        border: Border.all(width: 2, color: Colors.yellow),
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(60)),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const ReusableText(
                        text: 'Name',
                        sized: 32,
                        fontWeight: FontWeight.w700,
                        colors: Colors.black,
                        textAlign: TextAlign.center),
                    ReusableText(
                        text: 'Welcome back!',
                        sized: 24,
                        fontWeight: FontWeight.w400,
                        colors: Appcolors.lightpink,
                        textAlign: TextAlign.center),
                  ],
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.list,
                        size: 40,
                      )),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
