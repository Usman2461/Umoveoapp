import 'package:flutter/material.dart';

class CustomInputField extends StatefulWidget {
  TextEditingController? textController = TextEditingController();
  String text;
  bool isPasswordField;
  CustomInputField({Key? key, this.textController=null, required this.text, this.isPasswordField:false}) : super(key: key);

  @override
  _CustomInputFieldState createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Text(widget.text ,style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),),
      SizedBox(height: 5.0),
      TextFormField(
        obscureText: widget.isPasswordField,
        controller: widget.textController,
        decoration: InputDecoration(
          border: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: BorderSide.none),
          filled: true,
          fillColor: Color(0x8BD5DDE0),
          hintText: "",
          suffixIcon: widget.isPasswordField?Icon(Icons.remove_red_eye):null,
        ),
      ),

    ],);
  }
}
