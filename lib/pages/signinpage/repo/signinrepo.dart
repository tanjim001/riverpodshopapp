import 'package:firebase_auth/firebase_auth.dart';

class SignRepo{
  static Future<UserCredential>firebaseSignIn({required String email,required String password})async{
    final credential= await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    return credential;
  }
}