import 'package:flutter/material.dart';

class SocialLoginButton extends StatelessWidget {
  String imageIcon;
  Function onTap;
  SocialLoginButton({Key? key, required this.imageIcon, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onTap();
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        elevation: 5.0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image(height:40, width:40, image: AssetImage(imageIcon),),
        ),
      ),
    );
  }
}
