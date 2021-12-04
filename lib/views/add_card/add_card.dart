import 'package:flutter/material.dart';
import 'package:umoveo/widgets/custom_app_bar.dart';
import 'package:umoveo/widgets/custom_buttom.dart';
import 'package:umoveo/widgets/custom_text_field.dart';

class AddCard extends StatefulWidget {
  const AddCard({Key? key}) : super(key: key);

  @override
  _AddCardState createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        text: "Add Card",
        onTap: () { Navigator.pop(context);},
        showLeading: true,
        icon: Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              CustomInputField(text: "CARD NUMBER"),
              SizedBox(height: 10.0,),
              CustomInputField(text: "CARD HOLDER NAME"),
              SizedBox(height: 10.0,),
              Row(
                children: [
                  Expanded(child: CustomInputField(text: "EXP. DATE")),
                  SizedBox(width: 10.0,),
                  Expanded(child: CustomInputField(text: "")),
                ],
              ),
              SizedBox(
                height: 15.0,
              ),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0)),
                elevation: 5.0,
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Column(
                    children: [
                      ListTile(leading: Image(image: AssetImage("assets/images/scancard.png"),),title: Text("Scan card"),),
                     Divider(),
                      ListTile(leading: Image(image: AssetImage("assets/images/facescan.png"),),title: Text("Add face ID"),),
                    ],
                  )
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Center(
                child: CustomButtom(
                    leadingIcon: Icons.add,
                    negativeWidth: 20,
                    text: "Add Credit/Debit Card",
                    onTap: () {
                      Navigator.pushNamed(context, "/paymentDetails");
                    }),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
