import 'package:flutter/material.dart';

class ServicesSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;

    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Our Services", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
          SizedBox(height: 16),
          GridView.count(
            crossAxisCount: isMobile ? 1 : 3,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            childAspectRatio: 3,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            children: [
              serviceCard(Icons.web, "Web Development", "Responsive, SEO-friendly websites that convert."),
              serviceCard(Icons.phone_android, "Mobile App Development", "Cross-platform apps with Flutter & React Native."),
              serviceCard(Icons.dashboard_customize, "Custom Software", "Tailored desktop/web software for your business."),
              serviceCard(Icons.design_services, "UI/UX Design", "Clean, functional, and user-first interfaces."),
            ],
          ),
        ],
      ),
    );
  }

  Widget serviceCard(IconData icon, String title, String desc) {
    return InkWell(
      onTap: () {}, // You can add navigation here
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Row(
          children: [
            Icon(icon, size: 40, color: Colors.deepPurple),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Text(desc, style: TextStyle(fontSize: 14, color: Colors.black54)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
