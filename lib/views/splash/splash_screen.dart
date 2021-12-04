import 'package:flutter/material.dart';
import 'package:umoveo/widgets/custom_buttom.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(60.0),
                child: Image(
                  image: AssetImage("assets/images/splashlogo.png"),
                ),
              ),
              Positioned(
                  bottom: 20,
                  child: CustomButtom(
                    text: 'Get Started!',
                    trailingIcon: Icons.arrow_forward_ios,
                    onTap: () {
                      Navigator.pushNamed(context, "/login");
                    },
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
