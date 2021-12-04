import 'package:flutter/material.dart';
import 'package:umoveo/constants/colors.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:umoveo/views/code_verification/code_verification_screen.dart';
import 'package:umoveo/widgets/custom_app_bar.dart';
import 'package:umoveo/widgets/custom_buttom.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String selectedValue = "";
  String countrycode = "+92";
  TextEditingController numberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(text: "Sign Up", onTap: (){Navigator.pop(context);},),
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: SingleChildScrollView(
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
                        text: 'Continue',
                        onTap: () {
                          if (numberController.text.isNotEmpty)
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context) =>
                                    CodeVerification(
                                        number :"$countrycode${numberController.text}")));
                        },
                      )),
                ],
              ),
            ),
          )),
    );
  }
}
