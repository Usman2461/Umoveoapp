import 'package:firebase_auth/firebase_auth.dart';

class FirebaseUser{


  String id="";
  String userName="";
  String email="";
  String imageUrl="";

  FirebaseUser(this.id, this.userName, this.email, this.imageUrl);

  FirebaseUser.fromJson({required User userMap}){
    this.id = userMap.uid;
    this.userName = userMap.displayName!;
    this.email = userMap.email!;
    this.imageUrl = userMap.photoURL!;
  }

}