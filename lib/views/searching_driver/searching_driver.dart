import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SearchingDriver extends StatefulWidget {
  const SearchingDriver({Key? key}) : super(key: key);

  @override
  _SearchingDriverState createState() => _SearchingDriverState();
}



class _SearchingDriverState extends State<SearchingDriver> {
  late Timer timer;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    timer = Timer(Duration(seconds: 5), (){
      Navigator.pushNamed(context, "/arriving");
    });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    timer.cancel();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF3E4958),
      body: Container(
        child: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              SpinKitPulse(
                color: Colors.grey,
                size: 200.0,
              ),
              SpinKitPulse(
                color: Color(0xfff3f3f3),
                size: 140.0,
              ),
              Image(
                width: 80.0,
                height: 80.0,
                image: AssetImage("assets/images/searchvan.png"),
              ),
              Positioned(
                  bottom: 30,
                  child: Text(
                    "Searching for a driver",
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )),
              Positioned(
                  top: 40,
                  left: 20,
                  child: GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                      child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(Icons.close),
                  )))
            ],
          ),
        ),
      ),
    );
  }
}
