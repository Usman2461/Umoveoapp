import 'package:flutter/material.dart';
import 'package:umoveo/widgets/custom_app_bar.dart';
import 'package:umoveo/widgets/custom_buttom.dart';
import 'package:umoveo/widgets/custom_text_field.dart';

class CreateProfile extends StatefulWidget {
  const CreateProfile({Key? key}) : super(key: key);

  @override
  _CreateProfileState createState() => _CreateProfileState();
}

class _CreateProfileState extends State<CreateProfile> {
  GlobalKey formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(text: "Create Profile", onTap: (){Navigator.pop(context);},),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                CustomInputField(text: "FIRST NAME",),
                SizedBox(height: 15.0,),
                CustomInputField(text: "LAST NAME",),
                SizedBox(height: 15.0,),
                CustomInputField(text: "HOME ADDRESS",),
                SizedBox(height: 15.0,),
                CustomInputField(text: "PASSWORD", isPasswordField: true,),
                SizedBox(height: 15.0,),
                Text("By continuing, I confirm that i have read & agree to the Terms & conditions and Privacy policy", style: TextStyle(color: Colors.grey),),
                SizedBox(height: 15.0,),
                CustomButtom(text: "Register", onTap: (){
                    Navigator.pushNamed(context, "/signIn");
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
