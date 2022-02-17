import 'package:firebase_auth/firebase_auth.dart';

class AppCons {
  static String uid = FirebaseAuth.instance.currentUser!.uid;
}