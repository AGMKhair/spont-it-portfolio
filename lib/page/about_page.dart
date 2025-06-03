import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;

    return Scaffold(
      appBar: AppBar(
        title: Text("About Us"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Who We Are", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),
            Text(
              "SponT IT is a team of passionate software engineers delivering scalable and secure digital solutions. "
                  "With a focus on innovation and client satisfaction, we help businesses thrive in the digital world.",
              style: TextStyle(fontSize: 16, height: 1.6),
            ),
            SizedBox(height: 32),
            _sectionTitle("Our Mission"),
            Text(
              "To empower businesses with reliable, cutting-edge software solutions that drive success and growth.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 24),
            _sectionTitle("Our Vision"),
            Text(
              "To be a globally trusted partner in digital transformation through technology and innovation.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 32),
            _sectionTitle("Our Journey"),
            SizedBox(height: 16),
            _timelineStep("2022", "SponT IT founded with a vision to provide smart IT solutions."),
            _timelineStep("2023", "Expanded services to include mobile app and UI/UX design."),
            _timelineStep("2024", "Partnered with clients in multiple industries across the globe."),
          ],
        ),
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Text(title, style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600));
  }

  Widget _timelineStep(String year, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(Icons.timeline, color: Colors.deepPurple),
          SizedBox(width: 12),
          Text("$year: ", style: TextStyle(fontWeight: FontWeight.bold)),
          Expanded(child: Text(description)),
        ],
      ),
    );
  }
}
