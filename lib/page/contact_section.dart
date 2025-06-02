import 'package:flutter/material.dart';

class ContactSection extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;

    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Get in Touch", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
          SizedBox(height: 12),
          Text("We’d love to hear from you. Reach out for a free consultation or ask anything."),
          SizedBox(height: 32),
          isMobile
              ? Column(children: [_contactInfo(), SizedBox(height: 24), _contactForm()])
              : Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: _contactInfo()),
              SizedBox(width: 40),
              Expanded(child: _contactForm()),
            ],
          ),
        ],
      ),
    );
  }

  Widget _contactInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.phone, color: Colors.deepPurple),
            SizedBox(width: 8),
            Text("01985206505", style: TextStyle(fontSize: 16)),
          ],
        ),
        SizedBox(height: 12),
        Row(
          children: [
            Icon(Icons.email, color: Colors.deepPurple),
            SizedBox(width: 8),
            Text("info@spont-it.com", style: TextStyle(fontSize: 16)),
          ],
        ),
        SizedBox(height: 16),
        ElevatedButton.icon(
          onPressed: () {
            // You could launch WhatsApp URL
          },
          icon: Icon(Icons.whatshot_outlined),
          label: Text("Chat on WhatsApp"),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
          ),
        )
      ],
    );
  }

  Widget _contactForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          _inputField(label: "Name"),
          SizedBox(height: 16),
          _inputField(label: "Email"),
          SizedBox(height: 16),
          _inputField(label: "Message", maxLines: 4),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                // You can handle form logic here
              }
            },
            child: Text("Send Message"),
          ),
        ],
      ),
    );
  }

  Widget _inputField({required String label, int maxLines = 1}) {
    return TextFormField(
      maxLines: maxLines,
      validator: (val) => val == null || val.isEmpty ? 'Required' : null,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      ),
    );
  }
}
