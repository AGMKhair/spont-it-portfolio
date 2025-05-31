import 'package:flutter/material.dart';
import 'package:spontit/colors_util.dart';
import 'package:spontit/contact_section.dart';
import 'package:spontit/image.dart';
import 'package:spontit/sersvice_section.dart';
import 'package:spontit/why_choose_us_section.dart';
import 'package:spontit/widget/decorative_section.dart';
import 'package:spontit/widget/tilting_image.dart';

import 'testimonials_section.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    final isTab = MediaQuery.of(context).size.width < 800;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Header(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  HeroSection(
                    isMobile: isMobile,
                    isTab: isTab,
                  ),
                  ServicesSection(),
                  WhyChooseUsSection(),
                  TestimonialsSection(),
                  ContactSection(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          new BoxDecoration(gradient: ColorsUtil.headerGradient, boxShadow: [
        new BoxShadow(
          color: Colors.white,
          blurRadius: 20.0,
          spreadRadius: 1.0,
        )
      ]),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              ImageConstant.logo,
              width: 120,
            ),
            // Text(" SponT IT", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color: Colors.white)),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  NavButton("Home"),
                  NavButton("About"),
                  NavButton("Services"),
                  NavButton("Portfolio"),
                  NavButton("Contact"),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text("Get Quote"),
            ),
          ],
        ),
      ),
    );
  }
}

class NavButton extends StatelessWidget {
  final String title;

  const NavButton(this.title);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Text(title, style: TextStyle(fontSize: 16, color: Colors.white)),
    );
  }
}

class HeroSection extends StatelessWidget {
  final bool isMobile;
  final bool isTab;

  const HeroSection({required this.isMobile, required this.isTab});

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
      Text("Give Your Needs",
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.w900)),
      Text("Take Your Technical Solutions",
          style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              foreground: Paint()..shader = ColorsUtil.linearGradient)),
      SizedBox(height: 20),
      Text(
        "We develop customized software, mobile apps, and websites to accelerate your business success.",
        style: TextStyle(fontSize: 18, color: Colors.black87),
      ),
      SizedBox(height: 20),
      Row(
        children: [
          Container(
            decoration: new BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              gradient: ColorsUtil.containerGradient,
            ),
            padding: EdgeInsets.symmetric(vertical: 15),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  disabledForegroundColor: Colors.transparent,
                  disabledBackgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                ),
                onPressed: () {},
                child: Text(
                  "Get a Free Consultation",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w900),
                )),
          ),
          SizedBox(width: 10),
          OutlinedButton(
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                side: BorderSide(
                    color: Colors.deepPurple), // Optional: for visible border
              ),
              onPressed: () {},
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Text(
                  "View Our Work",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
                ),
              )),
        ],
      ),
      SizedBox(height: 40),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _stat("50+", "Projects Done", Colors.indigoAccent),
          SizedBox(width: 20),
          _stat("3+", "Years Experience", Colors.deepPurple),
          SizedBox(width: 20),
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
        Text(label, style: TextStyle(fontSize: 14, color: Colors.black54)),
      ],
    );
  }
}
