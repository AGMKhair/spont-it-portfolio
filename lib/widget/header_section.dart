import 'package:flutter/material.dart';
import 'package:spontit/util/image.dart';
import 'package:spontit/util/colors_util.dart';
import 'package:spontit/widget/nav_button.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
      BoxDecoration(gradient: ColorsUtil.headerGradient, boxShadow: const [
        BoxShadow(
          color: Colors.white,
          blurRadius: 20.0,
          spreadRadius: 1.0,
        )
      ]),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              ImageConstant.logo,
              width: 120,
            ),
            // Text(" SponT IT", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color: Colors.white)),
            const Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  NavButton("Home"),
                  NavButton("About"),
                  NavButton("Services"),
                  NavButton("Portfolio"),
                  NavButton("Contact"),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Get Quote"),
            ),
          ],
        ),
      ),
    );
  }
}
