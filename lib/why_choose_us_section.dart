import 'package:flutter/material.dart';

class WhyChooseUsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;

    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Why Choose Us", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
          SizedBox(height: 16),
          GridView.count(
            crossAxisCount: isMobile ? 1 : 2,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            children: [
              _reasonCard(Icons.people, "Experienced Developers", "Skilled professionals with deep tech expertise."),
              _reasonCard(Icons.schedule, "Timely Delivery", "We meet deadlines without compromising quality."),
              _reasonCard(Icons.attach_money, "Affordable Solutions", "High-quality software at competitive rates."),
              _reasonCard(Icons.support_agent, "Ongoing Support", "Reliable support even after project delivery."),
            ],
          ),
        ],
      ),
    );
  }

  Widget _reasonCard(IconData icon, String title, String desc) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.deepPurple.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.deepPurple.shade100),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
