import 'package:flutter/material.dart';
import 'package:rebuyy/constant/reusable_constant.dart';
import 'package:rebuyy/utils/appcolors.dart';

class SocialMedia extends StatelessWidget {
  final AssetImage image;

  const SocialMedia({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 57,
      width: 115,
      decoration: BoxDecoration(
        color: Appcolors.greys,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Center(child: Image(image: image)),
    );
  }
}

class LineOr extends StatelessWidget {
  const LineOr({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            height: 1,
            color: Colors.black,
          ),
        ),
        const ReusableText(
            text: 'Or',
            sized: 16,
            fontWeight: FontWeight.w400,
            colors: Appcolors.grey,
            textAlign: TextAlign.center),
        Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            height: 1,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}

class bluecon extends StatelessWidget {
  final IconData icon;
  final String titles;
  final String subTitle;

  const bluecon(
      {super.key,
      required this.icon,
      required this.subTitle,
      required this.titles});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      height: 88,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Appcolors.blueaccent),
      child: Center(
        child: ListTile(
          contentPadding: const EdgeInsets.only(left: 20),
          leading: Icon(
            icon,
            size: 50,
            color: Appcolors.agrey,
          ),
          title: Text(
            '$titles',
            style: const TextStyle(
                fontSize: 24,
                color: Appcolors.agrey,
                fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            '$subTitle',
            style: const TextStyle(
                fontSize: 15,
                color: Appcolors.agrey,
                fontWeight: FontWeight.w400),
          ),
        ),
      ),
    );
  }
}
