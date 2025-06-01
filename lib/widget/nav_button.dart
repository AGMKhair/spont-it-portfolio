import 'package:flutter/material.dart';

class NavButton extends StatelessWidget {
  final String title;

  const NavButton(this.title);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Text(title, style: TextStyle(fontSize: 16, color: Colors.white)),
    );
  }
}