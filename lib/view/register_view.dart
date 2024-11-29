import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rebuyy/constant/register_widget_constant.dart';
import 'package:rebuyy/constant/reusable_constant.dart';
import 'package:rebuyy/controllers/register_controller.dart';
import 'package:rebuyy/utils/appcolors.dart';

class RegisterView extends StatelessWidget {
  final RegisterController authController = Get.put(RegisterController());
  RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.lightgrey,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 1.5),
                  ),
                  child: const Center(child: Icon(Icons.arrow_back_ios)),
                ),
                const ReusableText(
                  text: 'ReBuy',
                  sized: 32,
                  fontWeight: FontWeight.w800,
                  colors: Appcolors.darkGrey,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            const SizedBox(height: 50),
            Obx(() {
              return ReusableText(
                text: authController.isLogin ? 'Login' : 'Sign Up',
                sized: 40,
                fontWeight: FontWeight.w800,
                colors: Appcolors.darkGrey,
                textAlign: TextAlign.center,
              );
            }),
            const SizedBox(height: 20),
            ReusableText(
                text: authController.isLogin
                    ? 'Login with one of the following options'
                    : 'Sign up with one of the following options',
                sized: 14,
                fontWeight: FontWeight.w400,
                colors: Appcolors.grey,
                textAlign: TextAlign.center),
            const SizedBox(height: 20),
            Row(
              children: [
                GestureDetector(
                  onTap: authController.loginWithGoogle,
                  child: SocialMedia(
                    image: AssetImage(
                      'assets/images/goopgle.png',
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const LineOr(),
            const SizedBox(height: 50),
            Obx(() {
              if (!authController.isLogin) {
                return Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Username',
                        filled: true,
                        fillColor: Appcolors.greys,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                            color: Appcolors.greys,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                            color: Appcolors.greys,
                          ),
                        ),
                      ),
                      style: const TextStyle(
                        color: Appcolors.greyss,
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                );
              }
              return const SizedBox();
            }),
            const SizedBox(height: 20),
            TextField(
              onChanged: (value) {
                authController.isLogin
                    ? authController.loginEmail.value = value
                    : authController.signupEmail.value = value;
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: Appcolors.greys,
                hintText: 'Email',
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(
                    color: Appcolors.greys,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(
                    color: Appcolors.greys,
                  ),
                ),
              ),
              style: const TextStyle(
                color: Appcolors.greyss,
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              onChanged: (value) {
                authController.isLogin
                    ? authController.loginPassword.value = value
                    : authController.signupPassword.value = value;
              },
              decoration: InputDecoration(
                hintText: 'Password',
                filled: true,
                fillColor: Appcolors.greys,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(
                    color: Appcolors.greys,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(
                    color: Appcolors.greys,
                  ),
                ),
              ),
              style: const TextStyle(
                color: Appcolors.greyss,
              ),
              obscureText: true,
              validator: (value) => value == null || value.length < 6
                  ? 'Password must be at least 6 characters.'
                  : null,
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: authController.submit,
              style: ElevatedButton.styleFrom(
                  backgroundColor: Appcolors.lightpink,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  )),
              child: const Text('Continue'),
            ),
          ],
        ),
      ),
    );
  }
}
