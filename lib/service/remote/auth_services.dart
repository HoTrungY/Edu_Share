import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edu_share/service/remote/body/change_password_body.dart';
import 'package:edu_share/service/remote/body/forgot_password_body.dart';
import 'package:edu_share/service/remote/body/login_body.dart';
import 'package:edu_share/service/remote/body/resigter_body.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../models/user_model.dart';

abstract class ImplAuthServices {
  Future<dynamic> register(RegisterBody body);
  Future<dynamic> login(LoginBody body);
  Future<dynamic> forgotPassword(ForgotPasswordBody body);
  Future<dynamic> changePassword(ChangePasswordBody body);
}

class AuthServices implements ImplAuthServices {
  @override
  Future<dynamic> register(RegisterBody body) async {
    try {
      CollectionReference userCollection = FirebaseFirestore.instance
          .collection('users');

      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: body.email ?? '',
        password: body.password ?? '',
      );

      UserModel user =
          UserModel()
            ..name = body.name
            ..email = body.email
            ..avatar = body.avatar;
      await userCollection.doc(user.email).set(user.toJson());
    } on FirebaseException catch (e) {
      throw Exception(e.message);
    }
  }

  @override
  Future<dynamic> login(LoginBody body) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: body.email ?? '',
        password: body.password ?? '',
      );
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message);
    }
  }

  @override
  Future<dynamic> forgotPassword(ForgotPasswordBody body) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: body.email ?? '',
      );
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message);
    }
  }

  @override
  Future<dynamic> changePassword(ChangePasswordBody body) async {
    try {
      final loginUser = FirebaseAuth.instance.currentUser;
      final credential = EmailAuthProvider.credential(
        email: body.email ?? '',
        password: body.currentPassword ?? '',
      );
      await loginUser?.reauthenticateWithCredential(credential);

      await loginUser?.updatePassword(body.newPassword ?? '');
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message);
    }
  }
}
