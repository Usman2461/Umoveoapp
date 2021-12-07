import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:umoveo/constants/colors.dart';
import 'package:umoveo/views/code_verification/code_verification_screen.dart';
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

  String selectedValue = "";
  String countrycode = "+92";
  TextEditingController numberController = TextEditingController();

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
                Text(
                  "Enter Mobile Number",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w800),
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextField(
                  autofocus: true,
                  keyboardType: TextInputType.phone,
                  controller: numberController,
                  decoration: InputDecoration(
                    prefixIcon: CountryCodePicker(
                      onChanged: (value) {
                        countrycode = value.code!;
                      },
                      hideSearch: true,
                    ),
                    border: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide.none),
                    filled: true,
                    fillColor: Color(0x8BD5DDE0),
                    hintText: "",
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "By continuing, I confirm that i have read & agree to the Terms & conditions and Privacy policy",
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(
                  height: 50.0,
                ),
                Center(
                    child: CustomButtom(
                      text: 'Sign In',
                      onTap: () {
                        if (numberController.text.isNotEmpty)
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) =>
                                  CodeVerification(
                                      number :"$countrycode${numberController.text}")));
                      },
                    )),
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
                        onPressed: () {
                          Navigator.popAndPushNamed(context, "/login");
                        }, child: Text("Sign up", style: TextStyle(color: Color(purpleC)),))
                  ],),
                SizedBox(height: 20.0,),

              ],),
          ),
        ),
      ),
    );
  }
}
