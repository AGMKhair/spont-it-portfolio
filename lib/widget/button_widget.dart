import 'package:flutter/material.dart';
import 'package:spontit/util/colors_util.dart';
import 'package:spontit/util/size_util.dart';

class Button extends StatelessWidget {
  String text;
  bool arrow;
  double width;

  Button({super.key, required this.text,this.width = 220, this.arrow = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: SizeUtil.margin_15,horizontal: SizeUtil.margin_10),
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        gradient: ColorsUtil.buttonGradient,
      ),
      padding: EdgeInsets.symmetric(vertical: SizeUtil.padding_10),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            disabledForegroundColor: Colors.transparent,
            disabledBackgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
          ),
          onPressed: () {},
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: TextStyle(
                    color: Colors.white, fontSize: SizeUtil.text_18, fontWeight: FontWeight.w900),
              ),
              if(arrow)
              Padding(
                padding:  EdgeInsets.only(left: SizeUtil.padding_10),
                child: Icon(Icons.arrow_forward_ios_rounded,color: Colors.white,),
              )
            ],
          )),
    );
  }
}
