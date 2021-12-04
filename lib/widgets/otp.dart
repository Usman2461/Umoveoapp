import 'package:flutter/material.dart';
import 'package:umoveo/constants/colors.dart';

class OtpField extends StatefulWidget {
  bool first, last;
  OtpField({Key? key, this.first:false, this.last:false}) : super(key: key);

  @override
  _OtpFieldState createState() => _OtpFieldState();
}

class _OtpFieldState extends State<OtpField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85,
      child: AspectRatio(
        aspectRatio: 0.5,
        child: TextField(
          autofocus: true,
          onChanged: (value) {
            if (value.length == 1 && widget.last == false) {
              FocusScope.of(context).nextFocus();
            }
            if (value.length == 0 && widget.first == false) {
              FocusScope.of(context).previousFocus();
            }
          },
          showCursor: false,
          readOnly: false,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color: Color(purpleC)),
          keyboardType: TextInputType.phone,
          maxLength: 1,
          decoration: InputDecoration(
            counter: Offstage(),

          ),
        ),
      ),
    );
  }
}
