import 'package:flutter/material.dart';
import 'package:umoveo/constants/colors.dart';
import 'package:umoveo/widgets/custom_app_bar.dart';
import 'package:umoveo/models/recent_locations.dart';

class AddressSelection extends StatefulWidget {
  const AddressSelection({Key? key}) : super(key: key);

  @override
  _AddressSelectionState createState() => _AddressSelectionState();
}

class _AddressSelectionState extends State<AddressSelection> {
  TextEditingController locFirst = TextEditingController();
  TextEditingController locSecond = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    locFirst.text = "24, Ocean avenue";
    locSecond.text = "King Cro";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          text: 'Select Address',
          onTap: () {
            Navigator.pop(context);
          },
          showLeading: true,
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Color(0x7FF3F3F3),
          padding: EdgeInsets.only(top: 30.0),
          child: Card(
            elevation: 15.0,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(20.0),topLeft: Radius.circular(20.0))),
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0)),
                    elevation: 5.0,
                    child: Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image(
                              height: 100,
                              width: 20.0,
                              image: AssetImage("assets/images/arrowloc.png")),
                          Column(
                            children: [
                              Container(
                                  height: 50,
                                  width: MediaQuery.of(context).size.width - 100,
                                  child: TextField(
                                    decoration:
                                        InputDecoration(fillColor: Colors.black),
                                    controller: locFirst,
                                  )),
                              Container(
                                  height: 50,
                                  width: MediaQuery.of(context).size.width - 100,
                                  child: TextField(
                                    decoration: InputDecoration(
                                        border: UnderlineInputBorder(
                                            borderSide: BorderSide.none)),
                                    controller: locSecond,
                                  )),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: [
                        Image(
                          width: 10,
                          height: 20,
                          image: AssetImage("assets/images/locpoint.png"),
                        ),
                        TextButton(onPressed: () {
                          Navigator.pushNamed(context, "/locationViaMap");
                        }, child: Text("Show on a map"))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "RECENT",
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Color(lightGreyC),
                              child: Icon(Icons.location_on_rounded,
                                  color: Colors.white),
                            ),
                            title: Text(
                              recentLocations[index].address,
                              overflow: TextOverflow.ellipsis,
                            ),
                            subtitle: Text(recentLocations[index].countryName),
                          );
                        },
                        separatorBuilder: (context, index) => Divider(),
                        itemCount: recentLocations.length),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
