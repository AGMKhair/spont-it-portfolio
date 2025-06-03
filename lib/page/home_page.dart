import 'package:flutter/material.dart';
import 'package:spontit/page/contact_section.dart';
import 'package:spontit/page/service_section.dart';
import 'package:spontit/page/why_choose_us_section.dart';
import 'package:spontit/widget/footer_section.dart';
import 'package:spontit/widget/header_section.dart';
import 'package:spontit/widget/home_top_section.dart';

import 'testimonials_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
                  Footer()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}





