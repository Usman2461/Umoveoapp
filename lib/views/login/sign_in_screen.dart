import 'package:flutter/material.dart';
import 'package:umoveo/constants/colors.dart';
import 'package:umoveo/widgets/custom_app_bar.dart';
import 'package:umoveo/widgets/custom_buttom.dart';
import 'package:umoveo/widgets/custom_text_field.dart';
import 'package:umoveo/widgets/social_login_button.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(text: "Sign In", onTap: (){Navigator.pop(context);},),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Container(
            height: MediaQuery
                .of(context)
                .size
                .height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomInputField(text: "EMAIL",),
                SizedBox(height: 10,),
                CustomInputField(text: "PASSWORD", isPasswordField: true,),
                SizedBox(height: 10,),
                TextButton(onPressed: () {
                  Navigator.pushNamed(context, "/resetPass");
                },
                    child: Text("Forgot Password?",
                      style: TextStyle(color: Colors.grey),)),
                Center(child: CustomButtom(text: "Sign In", onTap: () {
                  Navigator.pushNamed(context, "/mainMenu");
                },)),
                SizedBox(height: 20.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(width: 50,
                        child: Divider(thickness: 1, color: Colors.black,)),
                    SizedBox(width: 10.0,),
                    Text("OR SIGN IN WITH"),
                    SizedBox(width: 10.0,),
                    Container(width: 50,
                        child: Divider(thickness: 1, color: Colors.black,)),

                  ],),
                SizedBox(height: 10.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialLoginButton(
                      imageIcon: "assets/images/googl.png", onTap: () {},),
                    SizedBox(width: 10.0,),
                    SocialLoginButton(
                      imageIcon: "assets/images/facebook.png", onTap: () {},),
                  ],
                ),
                SizedBox(height: 50.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Dont have an account?"),
                    TextButton(
                        onPressed: () {}, child: Text("Sign up", style: TextStyle(color: Color(purpleC)),))
                  ],),
                SizedBox(height: 20.0,),

              ],),
          ),
        ),
      ),
    );
  }
}
