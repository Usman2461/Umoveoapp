import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:umoveo/constants/colors.dart';
import 'package:umoveo/views/main_menu/menu_drawer.dart';
import 'package:umoveo/widgets/custom_app_bar.dart';
import 'package:umoveo/widgets/custom_buttom.dart';

class LeaveFeedback extends StatefulWidget {
  const LeaveFeedback({Key? key}) : super(key: key);

  @override
  _LeaveFeedbackState createState() => _LeaveFeedbackState();
}

class _LeaveFeedbackState extends State<LeaveFeedback> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        text: 'Leave Feedback',
        showLeading: true,
        icon: Image(
          width: 5,
          height: 5,
          image: AssetImage("assets/images/menuicon.png"),
        ),
        onTap: () {},
        enableDrawer: true,
      ),
      drawer: CustomDrawer(),
      bottomSheet: Stack(
        clipBehavior: Clip.none,
        children: [
          Card(
            elevation: 5.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20.0),
                    topLeft: Radius.circular(20.0))),
            child: Container(
              height: 340.0,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(top: 60.0, left: 20.0, right: 20.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Patrick",
                          style: TextStyle(
                              fontSize: 25.0, fontWeight: FontWeight.bold),
                        ),
                        Expanded(child: SizedBox()),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        RatingStars(
                          starColor: Color(purpleC),
                          valueLabelVisibility: false,
                          value: 4,
                          starSize: 25,
                        ),
                      ],
                    ),
                    Center(child: Text("Excellent")),
                    SizedBox(
                      height: 8.0,
                    ),

                    Card(
                      clipBehavior: Clip.hardEdge,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                      child: TextField(
                        maxLines: 5,
                        decoration: InputDecoration(
                            border:
                                UnderlineInputBorder(borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(20.0)
                                ),
                            hintText: "Message",
                            filled: true,
                            fillColor: Color(lightGreyC)),
                      ),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    CustomButtom(negativeWidth: 50,text: "Rate", onTap: () {}),
                    SizedBox(
                      width: 5.0,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: -60,
            left: -10,
            child: Container(
                decoration: BoxDecoration(
                    border: Border(bottom: BorderSide.none),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100.0),
                    boxShadow: [BoxShadow(offset: Offset.fromDirection(11))]),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: CircleAvatar(
                    backgroundImage: AssetImage("assets/images/dpprofile.png"),
                    radius: 45,
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
