


import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: Colors.indigo[900],
      child: Center(
        child: Text(
          '© ${DateTime.now().year} SponT IT. All rights reserved.',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );

  }
}
