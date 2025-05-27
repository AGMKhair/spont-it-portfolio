import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:spontit/contact_section.dart';
import 'package:spontit/image.dart';
import 'package:spontit/sersvice_section.dart';
import 'package:spontit/why_choose_us_section.dart';

import 'testimonials_section.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Header(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  HeroSection(isMobile: isMobile),
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
    return
     Container(
        decoration: new BoxDecoration(
            gradient: new LinearGradient(
                colors: [
                  Colors.blueAccent,
                  Colors.deepPurple
                ]
            ),
            boxShadow: [
              new BoxShadow(
                color: Colors.white,
                blurRadius: 20.0,
                spreadRadius: 1.0,
              )
            ]
        ),

        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 32.0, vertical: 20.0),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(ImageConstant.logo,width: 120,),
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
      child: Text(title,
          style: TextStyle(fontSize: 16, color: Colors.white)),
    );
  }
}

class HeroSection extends StatelessWidget {
  final bool isMobile;
  const HeroSection({required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: isMobile
          ? Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: _heroContent(),
      )
          : Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: _heroContent())),
          Image.asset(ImageConstant.service, width: MediaQuery.sizeOf(context).width/3),
        ],
      ),
    );
  }

  List<Widget> _heroContent() {
    return [
      Text("Empowering Your", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
      Text("IT Solutions", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.deepPurple)),
      SizedBox(height: 20),
      Text(
        "We develop customized software, mobile apps, and websites to accelerate your business success.",
        style: TextStyle(fontSize: 18, color: Colors.black87),
      ),
      SizedBox(height: 20),
      Row(
        children: [
          ElevatedButton(onPressed: () {}, child: Text("Get a Free Consultation")),
          SizedBox(width: 10),
          OutlinedButton(onPressed: () {}, child: Text("View Our Work")),
        ],
      ),
      SizedBox(height: 40),
      Row(
        children: [
          _stat("50+", "Projects Done"),
          SizedBox(width: 20),
          _stat("3+", "Years Experience"),
          SizedBox(width: 20),
          _stat("24/7", "Support"),
        ],
      ),
    ];
  }

  Widget _stat(String value, String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(value, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.deepPurple)),
        Text(label, style: TextStyle(fontSize: 14, color: Colors.black54)),
      ],
    );
  }
}
