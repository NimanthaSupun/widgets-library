import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:recap/models/user_model.dart';
import 'package:recap/service/auth/auth_service.dart';

class UserService {
  final CollectionReference userCollection = FirebaseFirestore.instance
      .collection('users');

  Future<void> saveUser(UserModel user) async {
    try {
      final userCredential = await AuthService().createUserWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );

      final userId = userCredential.user?.uid;

      if (userId != null) {


        final userRef = userCollection.doc(userId);
        final userMap = user.toJson();
        userMap['userId'] = userId;
        await userRef.set(userMap);
      } else {
        print("user Id is null");
      }
    } catch (err) {
      print('Error save user: ${err}');
    }
  }
}
