import 'package:flutter/material.dart';
import 'package:umoveo/widgets/custom_app_bar.dart';

import 'menu_drawer.dart';
import 'menu_widgets/truck_card.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        text: '',
        showLeading: true,
        icon: Image(
          width: 5,
          height: 5,
          image: AssetImage("assets/images/menuicon.png"),
        ),
        onTap: () {

        },
          enableDrawer:true,
      ),
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(bottom: 18.0, right: 18.0, left: 18.0),
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 3,
                width: MediaQuery.of(context).size.width,
                child: Image(
                  image: AssetImage("assets/images/headermain.png"),
                ),
              ),
              Text(
                "Select Vehicle Type",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TruckCard(
                    imageUrl: "assets/images/smalltruck.png",
                    name: "Small Trucks",
                    onTap: () {
                      Navigator.pushNamed(context, "/selectVehicle");
                    },
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  TruckCard(
                    imageUrl: "assets/images/lighttruck.png",
                    name: "Light Trucks",
                    onTap: () {},
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TruckCard(
                    imageUrl: "assets/images/mediumtruck.png",
                    name: "Medium Trucks",
                    onTap: () {},
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  TruckCard(
                    imageUrl: "assets/images/heavytruck.png",
                    name: "Heavy Trucks",
                    onTap: () {},
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TruckCard(
                    imageUrl: "assets/images/veryheavytruck.png",
                    name: "Very Heavy Trucks",
                    onTap: () {},
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  TruckCard(
                    imageUrl: "assets/images/transporter.png",
                    name: "Transporter",
                    onTap: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
