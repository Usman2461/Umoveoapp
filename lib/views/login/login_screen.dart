import 'package:flutter/material.dart';
import 'package:umoveo/widgets/custom_app_bar.dart';
import 'package:umoveo/widgets/custom_buttom.dart';
import 'package:umoveo/widgets/social_login_button.dart';
class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(text: "Sign Up", onTap: (){Navigator.pop(context);},),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(18.0),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image(height: MediaQuery.of(context).size.height/2-80,image: AssetImage("assets/images/headerlogin.png"),),
              SizedBox(height: 10.0,),
              Text("Welcome Back", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),),
              SizedBox(height: 10.0,),
              Text("Umoveo Dispatch Service\n For Delivery Goods",textAlign: TextAlign.center, style: TextStyle(fontSize: 14.0),),
              SizedBox(height: 25.0,),
              CustomButtom(text: "Register your number", onTap: (){
                Navigator.pushNamed(context, "/signup");
              },),
              SizedBox(height: 20.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Container(width:50,child: Divider(thickness: 1, color: Colors.black,)),
                  SizedBox(width: 10.0,),
                Text("OR SIGN IN WITH"),
                  SizedBox(width: 10.0,),
                  Container(width:50,child: Divider(thickness: 1, color: Colors.black,)),

              ],),
              SizedBox(height: 10.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialLoginButton(imageIcon: "assets/images/googl.png", onTap: (){},),
                  SizedBox(width: 10.0,),
                  SocialLoginButton(imageIcon: "assets/images/facebook.png",onTap: (){},),
                ],
              ),
            ],
          ),),
        ),
      ),
    );
  }
}
