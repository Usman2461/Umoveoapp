import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:umoveo/widgets/custom_app_bar.dart';

class FeedbackPage extends StatefulWidget {
  const FeedbackPage({Key? key}) : super(key: key);

  @override
  _FeedbackPageState createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  TextStyle style1 = TextStyle(fontSize: 16.0);
  TextStyle style2 = TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF0EEEE),
      appBar: CustomAppBar(
        text: "Invoice",
        onTap: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
        showLeading: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              Card(
                elevation: 5.0,
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Pick up Date - Sun, 12 Sep, 8:00 AM",
                        style: style1,
                      ),
                      SizedBox(height: 10.0),
                      Text("Dropoff Date - Sun. 12 Sep, 1:00  PM",
                          style: style1),
                      SizedBox(height: 10.0),
                      Row(
                        children: [
                          Text("Shipping Cost", style: style1),
                          Expanded(child: SizedBox()),
                          Text("\$150", style: style2)
                        ],
                      ),
                      Divider(),
                      ListTile(
                        leading: Image(
                          height: 25,
                          width: 25,
                          image: AssetImage("assets/images/furniture.png"),
                        ),
                        title: Text("Furniture", style: style1),
                      ),
                      Divider(),
                      ListTile(
                        leading: Image(
                          height: 25,
                          width: 25,
                          image: AssetImage("assets/images/weight.png"),
                        ),
                        title: Text("Weight", style: style1),
                        trailing: Text("300 KG", style: style2),
                      ),
                      Divider(),
                      Row(
                        children: [
                          GestureDetector(
                            onTap:(){
                              Navigator.pushNamed(context, "/leaveFeedback");
                            },
                            child: Image(
                              width: 25,
                              height: 25,
                              image: AssetImage("assets/images/dpprofile.png"),
                            ),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text("Jack", style: style1),
                          SizedBox(
                            width: 10.0,
                          ),
                          RatingStars(
                            value: 4,
                            valueLabelVisibility: false,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Stack(
                        children: [
                          Card(
                            elevation: 3.0,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Row(children: [
                                    Text("11:24"),
                                    SizedBox(
                                      width: 15.0,
                                    ),
                                    Image(width: 15,height: 15,image: AssetImage("assets/images/circlehdpi.png") ,),
                                    SizedBox(
                                      width: 15.0,
                                    ),
                                    Expanded(child: Text("1, Thrale Street, London, SE19HW, UK")),
                                  ],),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Row(children: [
                                    Text("11:38"),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    Icon(Icons.arrow_drop_down,size: 30,),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    Expanded(child: Text("Ealing Broadway Shopping Centre, London, W55JY")),
                                  ],)
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            top: 20,
                              left:60,
                              child: Image(height:45, width:20,image: AssetImage("assets/images/linehdpi.png"),))
                        ],
                      ),
                      Row(
                        children: [
                          Text("Shipment Charges", style: style1),
                          Expanded(child: SizedBox()),
                          Text("\$100", style: style2)
                        ],
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        children: [
                          Text("Taxes & Fares", style: style1),
                          Expanded(child: SizedBox()),
                          Text("\$50", style: style2)
                        ],
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        children: [
                          Text("Total", style: style1),
                          Expanded(child: SizedBox()),
                          Text("\$150", style: style2)
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                  bottom: -25,
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Image(
                      width: MediaQuery.of(context).size.width - 45,
                      image: AssetImage("assets/images/invoiceborder.png"),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
