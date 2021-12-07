import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:umoveo/models/user_model.dart';

class FirebaseAuthService {


  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final googleSignIn = GoogleSignIn();

 //register with number
  Future registerWithNumber(String phoneNumber) async{
    ConfirmationResult results = await firebaseAuth.signInWithPhoneNumber(phoneNumber);
  }

  //login via google

  Future<FirebaseUser?> loginWithGoogle() async {
    GoogleSignInAccount? googleUser;
    try {
      final result = await googleSignIn.signIn();
      if (result == null) {
        return null;
      } else {
        googleUser = result;
        final googleAuth = await googleUser.authentication;
        final credentials = GoogleAuthProvider.credential(
            accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
        UserCredential firebaseUserResult = await firebaseAuth.signInWithCredential(credentials);
        User? user = firebaseUserResult.user;

        return  FirebaseUser.fromJson(userMap: user!);
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

 //login via facebook


}