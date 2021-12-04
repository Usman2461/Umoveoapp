import 'dart:async';

import 'package:flutter/material.dart';
import 'package:umoveo/models/tracking.dart';
import 'package:umoveo/widgets/custom_app_bar.dart';
import 'package:umoveo/widgets/custom_buttom.dart';

class RideHistory extends StatelessWidget {
  RideHistory({Key? key}) : super(key: key);
  StreamController listUpdated = StreamController.broadcast();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        text: "Tracking Status",
        onTap: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
        showLeading: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(18.0),
        child: Column(
          children: [
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
              elevation: 5.0,
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("TRACKING NO #1234567", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                        Divider(),
                        Container(
                          height: 350,
                          width: MediaQuery.of(context).size.width,
                          child: SingleChildScrollView(
                            child: StreamBuilder(
                                stream: listUpdated.stream,
                                builder: (context, snapshot) {
                                  return Column(
                                    children: [
                                      ...listTrack.map((e) => Stack(

                                        children: [
                                                  ListTile(leading: Text(e.time), title: Text(e.status), subtitle: Text(e.extraDetail),),
                                                  Positioned(
                                                      left: 60,
                                                      top: 20,
                                                      child: Image(
                                                        height: 50,
                                                        image: AssetImage(
                                                            "assets/images/arrowloc.png"),
                                                      ),),
                                        ],
                                      ))
                                    ],
                                  );
                                }),
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
            Expanded(child: SizedBox()),
            CustomButtom(text: "Generate Invoice", onTap: (){Navigator.pushNamed(context, "/feedback");}),
            SizedBox(height: 10,)
          ],
        ) ,
      ),
    );
  }
}