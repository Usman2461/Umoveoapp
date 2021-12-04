import 'package:flutter/material.dart';
import 'package:umoveo/views/add_card/add_card.dart';
import 'package:umoveo/views/address_selection/address_selection.dart';
import 'package:umoveo/views/arriving/arriving.dart';
import 'package:umoveo/views/booking_details/booking_details.dart';
import 'package:umoveo/views/chat_screen/chat.dart';
import 'package:umoveo/views/code_verification/code_verification_screen.dart';
import 'package:umoveo/views/create_profile/create_profile_screen.dart';
import 'package:umoveo/views/edit_profile/edit_profile_screen.dart';
import 'package:umoveo/views/feedback/feedback_page.dart';
import 'package:umoveo/views/feedback/leave_feedback.dart';
import 'package:umoveo/views/location_via_map/location_via_map.dart';
import 'package:umoveo/views/login/login_screen.dart';
import 'package:umoveo/views/login/sign_in_screen.dart';
import 'package:umoveo/views/main_menu/main_menu.dart';
import 'package:umoveo/views/payment_details/payment_details.dart';
import 'package:umoveo/views/payment_options/payment_options.dart';
import 'package:umoveo/views/reset_password/reset_password.dart';
import 'package:umoveo/views/ride_history/ride_history.dart';
import 'package:umoveo/views/searching_driver/searching_driver.dart';
import 'package:umoveo/views/select_vehicle/select_vehicle_screen.dart';
import 'package:umoveo/views/sign_up/sign_up_screen.dart';
import 'package:umoveo/views/splash/splash_screen.dart';
import 'package:umoveo/views/track_vehicle/track_vehicle.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ).copyWith(scaffoldBackgroundColor: Colors.white),
      routes: {
        "/splash" : (context)=>const SplashScreen(),
        "/login"  : (context)=>const LoginScreen(),
        "/signup" : (context)=>const SignUpScreen(),
        "/verify"  : (context)=> CodeVerification(number: '',),
        "/profile" : (context)=>const CreateProfile(),
        "/signIn"  : (context)=>const SignInScreen(),
        "/resetPass" : (context)=>const ResetPassword(),
        "/mainMenu" : (context)=>const MainMenu(),
        "/editProfile" : (context)=>const EditProfile(),
        "/selectVehicle" : (context) =>const  SelectVehicle(),
        "/addressSelection" : (context) =>const  AddressSelection(),
        "/locationViaMap" : (context) =>const  LocationViaMap(),
        "/bookingDetails" :(context) =>const BookingDetails(),
        "/paymentOption" : (context) =>const  PaymentOptions(),
        "/addCard" : (context) =>const AddCard(),
        "/paymentDetails" : (context) =>const  PaymentDetails(),
        "/searchingDriver" : (context) =>const  SearchingDriver(),
        "/arriving" : (context) =>const  Arriving(),
        "/chat" : (context) =>const  ChatPage(),
        "/trackVehicle" : (context) =>const  TrackVehicle(),
        "/rideHistory" : (context) => RideHistory(),
        "/feedback" : (context) =>const FeedbackPage(),
        "/leaveFeedback" :(context) =>const LeaveFeedback(),

      },
      home: const SplashScreen(),
    );
  }
}
