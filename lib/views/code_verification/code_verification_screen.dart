import 'dart:async';

import 'package:flutter/material.dart';
import 'package:umoveo/widgets/custom_app_bar.dart';
import 'package:umoveo/widgets/custom_buttom.dart';
import 'package:umoveo/widgets/otp.dart';

class CodeVerification extends StatefulWidget {
  String number;
  CodeVerification({Key? key, required this.number}) : super(key: key);

  @override
  State<CodeVerification> createState() => _CodeVerificationState();
}

class _CodeVerificationState extends State<CodeVerification> {
  StreamController<int> timeController = StreamController();

  late Timer timer;

  int seconds=30;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    timer.cancel();
    timeController.close();
  }
  @override
  void initState() {
    timer = Timer.periodic(Duration(seconds: 1), (timer){
      if(seconds>0) {
        seconds--;
        timeController.sink.add(seconds);
      }
      if(seconds==0)
      {
        seconds=30;
      }
      timeController.sink.add(seconds);
    });
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
        appBar: CustomAppBar(text: "Verify Code", showLeading: true, icon:  Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ), onTap: (){Navigator.pop(context);},),
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("A code has been sent to  ${widget.number} via SMS", textAlign: TextAlign.center,),
                SizedBox(height: 40.0,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    OtpField(first: true, last: false,),
                    OtpField(first: false, last: false,),
                    OtpField(first: false, last: false,),
                    OtpField(first: false, last: true,),
                  ],),
                ),
                StreamBuilder<int>(
                  stream: timeController.stream,
                  builder: (context, snapshot) {
                    if(snapshot.data==1){
                      timer.cancel();
                    }
                    return Column(
                      children: [
                        snapshot.data==1?TextButton(onPressed: (){
                          timer= Timer.periodic(Duration(seconds: 1), (timer){
                            if(seconds>0) {
                              seconds--;
                              timeController.sink.add(seconds);
                            }
                            if(seconds==0)
                            {
                              seconds=30;
                            }
                            timeController.sink.add(seconds);
                          });
                        }, child: Text("Resend Code", style: TextStyle(color: Colors.grey),)):TextButton(onPressed: (){}, child: Text("Resend code (0:${snapshot.hasData?snapshot.data:30}))")),
                        SizedBox(height: 20.0,),
                        CustomButtom(text: "Submit", onTap: (){
                          Navigator.pushNamed(context, "/profile");
                        },),
                      ],
                    );
                  }
                )

              ],
            ),
          ),
        ));
  }
}
