import 'package:flutter/material.dart';

class TruckCard extends StatelessWidget {
  Function onTap;
  String imageUrl;
  String name;
  TruckCard({Key? key, required this.onTap, required this.imageUrl, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onTap();
      },
      child: Card(
        elevation: 5.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          width: 125,
          height: 130,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            Image(image: AssetImage(imageUrl), width: 80, height: 80,),
            Text(name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),)
          ],),
        ),
      ),),
    );
  }
}
