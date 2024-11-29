import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rebuyy/constant/register_widget_constant.dart';
import 'package:rebuyy/constant/reusable_constant.dart';
import 'package:rebuyy/controllers/register_controller.dart';
import 'package:rebuyy/utils/appcolors.dart';

class AccountView extends StatelessWidget {
  final RegisterController authController = Get.put(RegisterController());
  final RxInt selectedButton = 0.obs; // Reactive variable for button state

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.lightgrey,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
          child: Column(
            children: [
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const ReusableText(
                    text: 'ReBuy',
                    sized: 32,
                    fontWeight: FontWeight.w800,
                    colors: Appcolors.darkGrey,
                    textAlign: TextAlign.center,
                  ),
                  IconButton(
                    onPressed: () => Get.back(),
                    icon: const Icon(Icons.cancel),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              // Account Options
              const bluecon(
                icon: Icons.person_3_outlined,
                titles: 'My Account',
                subTitle: 'Edit your details, account settings',
              ),
              const bluecon(
                icon: Icons.shopping_bag_outlined,
                titles: 'My Orders',
                subTitle: 'View all your orders',
              ),
              const bluecon(
                icon: Icons.list,
                titles: 'My Listings',
                subTitle: 'View your product listing for sale',
              ),
              const bluecon(
                icon: Icons.favorite_border_outlined,
                titles: 'Liked Items',
                subTitle: 'See the products you have wishlisted',
              ),
              const SizedBox(height: 50),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GetBuilder<RegisterController>(builder: (controller) {
                      return SizedBox(
                        height: 44,
                        width: 172,
                        child: ElevatedButton(
                          onPressed: () {
                            authController.updateButton(1);
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              authController.selectedButton.value == 1
                                  ? Appcolors.bgrey
                                  : Appcolors.lightgrey,
                            ),
                            side: MaterialStateProperty.all(
                              const BorderSide(
                                color: Appcolors.bgrey,
                                width: 2,
                              ),
                            ),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          child: Text(
                            'Feedback',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: authController.selectedButton.value == 1
                                  ? Colors.white
                                  : Appcolors.bgrey,
                            ),
                          ),
                        ),
                      );
                    }),
                    SizedBox(
                      height: 44,
                      width: 172,
                      child: ElevatedButton(
                        onPressed: () {
                          authController.logout();
                          selectedButton.value = 2;
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            authController.selectedButton.value == 2
                                ? Appcolors.bgrey
                                : Appcolors.lightgrey,
                          ),
                          side: MaterialStateProperty.all(
                            const BorderSide(
                              color: Appcolors.bgrey,
                              width: 2,
                            ),
                          ),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        child: Text(
                          'Sign out',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: authController.selectedButton.value == 2
                                ? Colors.white
                                : Appcolors.bgrey,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
