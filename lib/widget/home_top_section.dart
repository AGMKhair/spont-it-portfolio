import 'package:flutter/material.dart';
import 'package:spontit/util/colors_util.dart';
import 'package:spontit/util/image.dart';
import 'package:spontit/widget/decorative_section.dart';
import 'package:spontit/widget/tilting_image.dart';

class HeroSection extends StatelessWidget {
  final bool isMobile;
  final bool isTab;

  const HeroSection({super.key, required this.isMobile, required this.isTab});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: isMobile
          ? Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: _heroContent(),
      )
          : DecorativeSection(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: _heroContent())),
            SizedBox(width: isTab ? 10 : 50),
            TiltingImage(
              imagePath: ImageConstant.service,
              width: MediaQuery.sizeOf(context).width / 3,
            ),
            // Image.asset(ImageConstant.service,
            //     width: MediaQuery.sizeOf(context).width / 3),
          ],
        ),
      ),
    );
  }

  List<Widget> _heroContent() {
    return [
      const Text("Give Your Needs",
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.w900)),
      Text("Take Your Technical Solutions",
          style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              foreground: Paint()..shader = ColorsUtil.linearGradient)),
      const SizedBox(height: 20),
      const Text(
        "We develop customized software, mobile apps, and websites to accelerate your business success.",
        style: TextStyle(fontSize: 18, color: Colors.black87),
      ),
      const SizedBox(height: 20),
      Row(
        children: [
          Container(
            decoration: new BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              gradient: ColorsUtil.containerGradient,
            ),
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  disabledForegroundColor: Colors.transparent,
                  disabledBackgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                ),
                onPressed: () {},
                child: const Text(
                  "Get a Free Consultation",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w900),
                )),
          ),
          const SizedBox(width: 10),
          OutlinedButton(
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                side: const BorderSide(
                    color: Colors.deepPurple), // Optional: for visible border
              ),
              onPressed: () {},
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 20.0),
                child: Text(
                  "View Our Work",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
                ),
              )),
        ],
      ),
      const SizedBox(height: 40),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _stat("50+", "Projects Done", Colors.indigoAccent),
          const SizedBox(width: 20),
          _stat("3+", "Years Experience", Colors.deepPurple),
          const SizedBox(width: 20),
          _stat("24/7", "Support", Colors.red),
        ],
      ),
    ];
  }

  Widget _stat(String value, String label, Color colors) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(value,
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: colors)),
        Text(label, style: const TextStyle(fontSize: 14, color: Colors.black54)),
      ],
    );
  }
}