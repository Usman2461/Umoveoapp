import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  String text;
  Widget icon;
  bool showLeading;
  bool enableDrawer;
  Function onTap;
  CustomAppBar({Key? key, required this.text, this.icon=const Icon(Icons.not_interested), this.showLeading=false, required this.onTap, this.enableDrawer=false}) : super(key: key);

  @override
  AppBar build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      centerTitle: true,
      backgroundColor: Colors.white,
      title: Text(
        text,
        style: TextStyle(
            color: Colors.black, fontSize: 20, fontWeight: FontWeight.w800),
      ),
      leading: showLeading==false?null:Builder(
          builder: (context) {
            return GestureDetector(
              onTap: (){
                if(enableDrawer==true) {
                  Scaffold.of(context).openDrawer();
                }else{
                  onTap();
                }

              },
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Card(elevation:4.0,shape: CircleBorder(), child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: icon
                ),),
              ),
            );
          }
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}