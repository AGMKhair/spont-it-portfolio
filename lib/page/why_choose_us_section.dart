import 'package:flutter/material.dart';
import 'package:spontit/util/colors_util.dart';
import 'package:spontit/widget/hover_widget.dart';

class WhyChooseUsSection extends StatelessWidget {

   var isMobile;
   var isTab;

  WhyChooseUsSection({super.key});
  @override
  Widget build(BuildContext context) {
     isMobile = MediaQuery.of(context).size.width < 600;
     isTab = MediaQuery.of(context).size.width < 900;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [

        RichText(
          text: TextSpan(
            text: 'Why ',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            children: [
              TextSpan(
                text: 'Choose Us?',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  foreground: Paint()..shader = ColorsUtil.textGradient50,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
        Text(
            "We combine expertise, reliability, and innovation to deliver exceptional results for your business.",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        SizedBox(height: 20),
        GridView.count(
          crossAxisCount: isMobile ? 1 : isTab ? 3 : 4,
          shrinkWrap: true,
          childAspectRatio: MediaQuery.sizeOf(context).width *
              (isMobile
                  ? 0.005
                  : isTab
                  ? 0.0011
                  : 0.0009),
          physics: NeverScrollableScrollPhysics(),
          mainAxisSpacing:isMobile ? 10 :  20,
          crossAxisSpacing: isMobile ? 10 : 20,
          children: [
            HoverWidget(child: _reasonCard(Icons.people, "Experienced Developers", "Skilled professionals with deep tech expertise.")),
            HoverWidget(child: _reasonCard(Icons.schedule, "Timely Delivery", "We meet deadlines without compromising quality.")),
            HoverWidget(child: _reasonCard(Icons.attach_money, "Affordable Solutions", "High-quality software at competitive rates.")),
            HoverWidget(child: _reasonCard(Icons.support_agent, "Ongoing Support", "Reliable support even after project delivery.")),
          ],
        ),
      ],
    );
  }

  Widget _reasonCard(IconData icon, String title, String desc) {
    return Container(
      padding: EdgeInsets.all(isMobile ? 10 : 20),
      decoration: BoxDecoration(
        color: Colors.deepPurple.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.deepPurple.shade100),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40, color: Colors.deepPurple),
          SizedBox(height: 12),
          Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          Text(desc, style: TextStyle(fontSize: 14, color: Colors.black87)),
        ],
      ),
    );
  }
}
