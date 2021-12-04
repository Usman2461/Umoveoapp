import 'package:flutter/material.dart';
import 'package:umoveo/constants/colors.dart';
import 'package:umoveo/widgets/custom_app_bar.dart';
import 'package:umoveo/widgets/custom_buttom.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController numberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController fbController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    numberController.text = "+1 926 483 32 52";
    emailController.text = "carson@mobility.com";
    fbController.text = "@carsonmobility";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(text: "", showLeading: true, icon:  Icon(
        Icons.arrow_back_ios,
        color: Colors.black,
      ), onTap: (){Navigator.pop(context);},),
      body: Container(
        padding: EdgeInsets.all(18.0),
        alignment: Alignment.center,
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              child: Image(image: AssetImage("assets/images/persondp.png")),
              backgroundColor: Color(0xFFF0EFEF),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              "Carson",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
            SizedBox(
              height: 10.0,
            ),
            Card(
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    TextField(
                      controller: numberController,
                      decoration: InputDecoration(
                        icon: CircleAvatar(
                          backgroundColor: Color(purpleC),
                          child: Icon(
                            Icons.phone,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                          icon: CircleAvatar(
                              backgroundColor: Color(purpleC),
                              child: Icon(
                                Icons.email,
                                color: Colors.white,
                              ))),
                    ),
                    TextField(
                      controller: fbController,
                      decoration: InputDecoration(
                        icon: CircleAvatar(
                          backgroundColor: Color(purpleC),
                          child: Icon(
                            Icons.facebook,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SwitchListTile.adaptive(
              value: false,
              onChanged: (value) {},
              title: Text("Notification"),
              subtitle: Text("For receiving driver messages"),
            ),
            Expanded(child: SizedBox()),
            CustomButtom(text: ("Delete Account"), onTap: () {})
          ],
        ),
      ),
    );
  }
}
