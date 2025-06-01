import 'package:flutter/material.dart';
import 'package:spontit/util/colors_util.dart';
import 'package:spontit/contact_section.dart';
import 'package:spontit/image.dart';
import 'package:spontit/sersvice_section.dart';
import 'package:spontit/why_choose_us_section.dart';
import 'package:spontit/widget/decorative_section.dart';
import 'package:spontit/widget/footer_section.dart';
import 'package:spontit/widget/header_section.dart';
import 'package:spontit/widget/home_top_section.dart';
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





