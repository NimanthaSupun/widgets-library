import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:recap/models/user_model.dart';

class UserService {
  final CollectionReference userCollection = FirebaseFirestore.instance
      .collection('users');

  Future<void> saveUser(UserModel user) async {
    try {} catch (err) {
      print('Error save user: ${err}');
    }
  }
}
