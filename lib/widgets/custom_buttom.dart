import 'package:flutter/material.dart';
import 'package:umoveo/constants/colors.dart';

class CustomButtom extends StatelessWidget {
  double height;
  double negativeWidth;
  double radius;
  int color;
  String text;
  IconData trailingIcon;
  IconData leadingIcon;
  Function onTap;

  CustomButtom(
      {Key? key,
      this.height: 60.0,
      this.negativeWidth: 80,
      this.radius: 15.0,
      this.color: purpleC,
      required this.text,
      required this.onTap,
      this.leadingIcon:Icons.not_interested,
      this.trailingIcon:Icons.not_interested})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onTap();
      },
      child: Container(
          height: height,
          width: MediaQuery.of(context).size.width - negativeWidth,
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Color(color),
              borderRadius: BorderRadius.circular(radius)),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Center(
                  child: Text(
                text,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 16),
              )),
              Positioned(
                  right: 12,
                  child: trailingIcon!=Icons.not_interested? Icon(
                    trailingIcon,
                    color: Colors.white,
                  ):SizedBox()),
              Positioned(
                left: 20,
                child: leadingIcon!=Icons.not_interested?CircleAvatar(
                  radius: 12.0,
                  child: Icon(leadingIcon),
                  backgroundColor: Colors.white,
                ):SizedBox(),
              )
            ],
          )),
    );
  }
}
