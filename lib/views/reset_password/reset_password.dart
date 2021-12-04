import 'package:flutter/material.dart';
import 'package:umoveo/widgets/custom_app_bar.dart';
import 'package:umoveo/widgets/custom_buttom.dart';
import 'package:umoveo/widgets/custom_text_field.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(text: "Reset Password", onTap: (){Navigator.pop(context);},),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomInputField(text: 'NEW PASSWORD', isPasswordField: true),
              SizedBox(height: 20,),
              CustomInputField(text:'CONFIRM PASSWORD', isPasswordField: true,),
              SizedBox(height: 30,),
              CustomButtom(negativeWidth:40,text: 'Reset', onTap: (){},),
            ],
          ),
        ),
      ),
    );
  }
}
