import 'package:flutter/material.dart';
import 'package:umoveo/constants/colors.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var headerSize = MediaQuery.of(context).size.height;
    return Drawer(
      child: Container(
        height: headerSize,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: headerSize / 3,
                  color: Color(purpleC),
                ),
                Positioned(
                  top: (headerSize/3) / 6,
                  left: 25,
                  child: Container(
                    height: (headerSize/3) / 2,
                    width: 80,
                    child: Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.topRight,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 45,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image(image:AssetImage("assets/images/persondp.png")),
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            Navigator.pushNamed(context, "/editProfile");
                          },
                          child: CircleAvatar(
                            backgroundColor: Colors.blue,
                            radius: 15,
                            child: Icon(
                              Icons.edit,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Positioned(
                            left: 10,
                            bottom: -15,
                            child: Text(
                              "Carson",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            )),
                        Positioned(
                            left: 10,
                            bottom: -40,
                            child: Text(
                              "Carson@mobility.com",
                              style:
                                  TextStyle(fontSize: 14, color: Colors.white),
                            ))
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 20.0,
                  right: 10.0,
                  child: Icon(Icons.close, color: Colors.white,),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            ListTile(
              leading: Icon(
                Icons.location_on_rounded,
                color: Color(purpleC),
              ),
              title: Text(
                "TRACK",
                style: TextStyle(fontWeight: FontWeight.w800),
              ),
              trailing: Card(elevation:4.0, shape: CircleBorder(), child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("1"),
              ),),
            ),
            ListTile(
              leading: Icon(
                Icons.person,
                color: Color(purpleC),
              ),
              title: Text(
                "PROFILE",
                style: TextStyle(fontWeight: FontWeight.w800),
              ),
            ),
            Expanded(child: SizedBox()),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 65.0),
                child: TextButton(onPressed: (){}, child: Text("Sign out", style: TextStyle(color: Color(purpleC)),)),
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
