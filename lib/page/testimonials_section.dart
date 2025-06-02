import 'package:flutter/material.dart';
import 'package:spontit/widget/hover_card.dart';
import 'package:spontit/widget/hover_widget.dart';

class TestimonialsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;

    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("What Our Clients Say", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
          SizedBox(height: 16),
          GridView.count(
            crossAxisCount: isMobile ? 1 : 3,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            childAspectRatio: 0.95,
            children: [
              HoverWidget(child: testimonialCard("SponT IT delivered our project ahead of schedule with exceptional quality.", "Sarah J.", "CEO, RetailCorp")),
              HoverWidget(child: testimonialCard("Their support team is responsive and really understands our needs.", "Ahmed K.", "Founder, EduSoft")),
              HoverWidget(child: testimonialCard("Great communication and impressive technical skills. Highly recommended!", "Lina M.", "CTO, MedTrack")),
            ],
          ),
        ],
      ),
    );
  }

  Widget testimonialCard(String quote, String name, String role) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            spreadRadius: 2,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.format_quote, size: 30, color: Colors.deepPurple),
          SizedBox(height: 10),
          Text(quote, style: TextStyle(fontSize: 16, color: Colors.black87)),
          Spacer(),
          Divider(),
          Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
          Text(role, style: TextStyle(fontSize: 12, color: Colors.grey[600])),
        ],
      ),
    );
  }
}
