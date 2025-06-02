import 'package:flutter/material.dart';
import 'package:spontit/util/colors_util.dart';
import 'package:spontit/widget/button_widget.dart';
import 'package:spontit/widget/hover_card.dart';

class ServicesSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    final isTab = MediaQuery.of(context).size.width < 900;

    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          RichText(
            text: TextSpan(
              text: 'Our ',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              children: [
                TextSpan(
                  text: 'Services',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    foreground: Paint()..shader = ColorsUtil.textGradient,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Text(
              "We offer comprehensive IT solutions to help your business grow and succeed in the digital landscape.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          SizedBox(height: 20),
          GridView.count(
            crossAxisCount: isMobile
                ? 1
                : isTab
                    ? 3
                    : 4,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            childAspectRatio: MediaQuery.sizeOf(context).width *
                (isMobile
                    ? 0.005
                    : isTab
                        ? 0.0011
                        : 0.0009),
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            children: [
              HoverCard(
                  icon: Icons.web,
                  title: "Web Development",
                  desc: "Responsive, SEO-friendly websites that convert."),
              HoverCard(
                  icon: Icons.phone_android,
                  title: "Mobile App Development",
                  desc: "Cross-platform apps with Flutter & React Native."),
              HoverCard(
                  icon: Icons.dashboard_customize,
                  title: "Custom Software",
                  desc: "Tailored desktop/web software for your business."),
              HoverCard(
                  icon: Icons.design_services,
                  title: "UI/UX Design",
                  desc: "Clean, functional, and user-first interfaces."),
            ],
          ),
          SizedBox(height: 20),
          Button(
            text: 'View All Services',
            arrow: true,
          )
        ],
      ),
    );
  }
}
