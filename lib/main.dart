import 'package:flutter/material.dart';
import 'package:spontit/page/home_page.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(SponTITApp());
}

class SponTITPortfolio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SponT IT Portfolio',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: PortfolioHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class PortfolioHomePage extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();

  void _scrollTo(double offset) {
    _scrollController.animateTo(
      offset,
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SponT IT'),
        actions: [
          _navButton('Home', () => _scrollTo(0)),
          _navButton('About', () => _scrollTo(600)),
          _navButton('Services', () => _scrollTo(1200)),
          _navButton('Projects', () => _scrollTo(1800)),
          _navButton('Clients', () => _scrollTo(2400)),
          _navButton('Contact', () => _scrollTo(3000)),
        ],
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            _heroSection(),
            _aboutSection(),
            _servicesSection(),
            _projectsSection(),
            _clientsSection(),
            _footer(),
            _contactSection(),

          ],
        ),
      ),
    );
  }

  Widget _navButton(String title, VoidCallback onPressed) {
    return TextButton(
      onPressed: onPressed,
      child: Text(title, style: const TextStyle(color: Colors.white)),
    );
  }

  Widget _heroSection() {
    return Container(
      height: 600,
      color: Colors.indigo,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('Welcome to SponT IT',
                style: TextStyle(fontSize: 48, color: Colors.white)),
            SizedBox(height: 16),
            Text(
              'Innovative IT Solutions for Web and Mobile',
              style: TextStyle(fontSize: 24, color: Colors.white70),
            ),
          ],
        ),
      ),
    );
  }

  Widget _aboutSection() {
    return Container(
      height: 600,
      color: Colors.white,
      padding: const EdgeInsets.all(40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text('About Us', style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold)),
          SizedBox(height: 20),
          Text(
            'SponT IT is a forward-thinking technology company specializing in crafting top-tier mobile and web applications. '
                'Our mission is to empower businesses through scalable, efficient, and user-centric software solutions.',
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }

  Widget _servicesSection() {
    return Container(
      height: 600,
      color: Colors.grey[100],
      padding: const EdgeInsets.all(40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Our Services', style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          Wrap(
            spacing: 20,
            runSpacing: 20,
            children: [
              _serviceCard(Icons.web, 'Web Development', 'Custom websites and dashboards with modern technologies.'),
              _serviceCard(Icons.phone_android, 'Mobile Apps', 'Cross-platform mobile apps using Flutter.'),
              _serviceCard(Icons.cloud, 'Cloud Solutions', 'Cloud hosting, APIs, and DevOps support.'),
              _serviceCard(Icons.security, 'IT Security', 'Securing digital assets with best practices.'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _serviceCard(IconData icon, String title, String description) {
    return SizedBox(
      width: 250,
      child: Card(
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Icon(icon, size: 48, color: Colors.indigo),
              const SizedBox(height: 10),
              Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              Text(description, textAlign: TextAlign.center),
            ],
          ),
        ),
      ),
    );
  }

  Widget _projectsSection() {
    return Container(
      height: 600,
      color: Colors.white,
      padding: const EdgeInsets.all(40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Our Projects', style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          Wrap(
            spacing: 20,
            runSpacing: 20,
            children: [
              _projectCard('Food Delivery App', 'https://example.com/app1'),
              _projectCard('Business Dashboard', 'https://example.com/web1'),
              _projectCard('E-Commerce Store', 'https://example.com/app2'),
            ],
          )
        ],
      ),
    );
  }

  Widget _projectCard(String title, String url) {
    return InkWell(
      onTap: () => launchUrl(Uri.parse(url)),
      child: SizedBox(
        width: 250,
        child: Card(
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const Icon(Icons.launch, size: 48, color: Colors.indigo),
                const SizedBox(height: 10),
                Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                Text('Click to view project', textAlign: TextAlign.center),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _clientsSection() {
    return Container(
      height: 600,
      color: Colors.grey[100],
      padding: const EdgeInsets.all(40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text('Our Clients', style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold)),
          SizedBox(height: 20),
          Text(
            'Trusted by startups and enterprises across various industries including healthcare, fintech, and logistics.',
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 20),
          Text('- ABC Corp\n- Global Logistics\n- MedTech Solutions\n- FinConnect Inc.', style: TextStyle(fontSize: 18)),
        ],
      ),
    );
  }

  Widget _contactSection() {
    final _formKey = GlobalKey<FormState>();
    final _nameController = TextEditingController();
    final _emailController = TextEditingController();
    final _messageController = TextEditingController();

    return Container(
      height: 600,
      padding: const EdgeInsets.all(40),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Contact Us', style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: 'Name'),
                  validator: (value) => value!.isEmpty ? 'Enter your name' : null,
                ),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(labelText: 'Email'),
                  validator: (value) => value!.isEmpty || !value.contains('@') ? 'Enter a valid email' : null,
                ),
                TextFormField(
                  controller: _messageController,
                  decoration: const InputDecoration(labelText: 'Message'),
                  maxLines: 4,
                  validator: (value) => value!.isEmpty ? 'Enter a message' : null,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Simulate submission
                      ScaffoldMessenger.of(_formKey.currentContext!).showSnackBar(
                        const SnackBar(content: Text('Message sent!')),
                      );
                      _nameController.clear();
                      _emailController.clear();
                      _messageController.clear();
                    }
                  },
                  child: const Text('Send Message'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _footer() {
    return Container(
      height: 100,
      color: Colors.indigo[900],
      child: const Center(
        child: Text(
          '© ${DateTime.monthsPerYear} SponT IT. All rights reserved.',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}


class SponTITApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SponT IT',
      theme: ThemeData(
        fontFamily: 'Poppins',
        brightness: Brightness.light,
        primarySwatch: Colors.deepPurple,
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
