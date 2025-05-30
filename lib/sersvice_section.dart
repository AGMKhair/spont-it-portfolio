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
            childAspectRatio: MediaQuery.sizeOf(context).width * (isMobile ? 0.006 : 0.0017),
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            children: [
              HoverCard(icon: Icons.web, title: "Web Development", desc: "Responsive, SEO-friendly websites that convert."),
              HoverCard(icon: Icons.phone_android, title: "Mobile App Development", desc: "Cross-platform apps with Flutter & React Native."),
              HoverCard(icon: Icons.dashboard_customize, title: "Custom Software", desc: "Tailored desktop/web software for your business."),
              HoverCard(icon: Icons.design_services, title: "UI/UX Design", desc: "Clean, functional, and user-first interfaces."),
            ],
          ),
        ],
      ),
    );
  }
}

class HoverCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final String desc;

  const HoverCard({Key? key, required this.icon, required this.title, required this.desc}) : super(key: key);

  @override
  _HoverCardState createState() => _HoverCardState();
}

class _HoverCardState extends State<HoverCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeOutCubic,
        transform: Matrix4.identity()..scale(_isHovered ? 1.06 : 1.0),
        transformAlignment: Alignment.center,
        decoration: BoxDecoration(
          color: _isHovered ? Colors.deepPurple.shade50 : Colors.grey.shade100,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade300),
          boxShadow: _isHovered
              ? [BoxShadow(color: Colors.deepPurple.withOpacity(0.2), blurRadius: 20, spreadRadius: 1, offset: Offset(0, 8))]
              : [],
        ),
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(widget.icon, size: 40, color: Colors.deepPurple),
            SizedBox(height: 16),
            Text(widget.title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(widget.desc, style: TextStyle(fontSize: 14, color: Colors.black54)),
          ],
        ),
      ),
    );
  }
}
