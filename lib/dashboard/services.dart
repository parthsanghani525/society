import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:society/dashboard/parking_model.dart';
import 'package:society/dashboard/user_model.dart';
import 'package:society/provider/user_list_provider.dart';

UserModel userModel = UserModel();

class Services {
  static Stream<List<UserModel>> getData(String? uid) {
    return FirebaseFirestore.instance.collection('users').snapshots().map(
        (event) => event.docs
            .map((e) => UserModel.fromjson(e.data() as Map<String, dynamic>))
            .toList());
  }

  static Stream<List<ParkingModel>> getUserParkingData(String id) {
    return FirebaseFirestore.instance
        .collection('users')
        .doc(id)
        .collection('parking')
        .snapshots()
        .map((event) => event.docs.map((e) => ParkingModel.fromjson(e.data() as Map<String, dynamic>)).toList());
  }

  static Future<DocumentSnapshot?> getUserData() async {
    var firebaseuser = await FirebaseAuth.instance.currentUser!;
    return await FirebaseFirestore.instance
        .collection('users')
        .doc(firebaseuser.uid)
        .get();
  }
}
