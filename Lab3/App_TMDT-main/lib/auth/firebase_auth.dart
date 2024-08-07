import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class FirebAuth {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  String UID = "";
  void signUp(String email, String password, Function onSuccess, Function(String) DangKiloi) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = _firebaseAuth.currentUser;
      if (user != null) {
        String uid = user.uid;
        await _createUser(uid, email, password, onSuccess, DangKiloi);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        DangKiloi('Email đã được sử dụng. Vui lòng sử dụng email khác.');
      } else if (e.code == 'invalid-email') {
        DangKiloi('Email không hợp lệ. Vui lòng thử lại.');
      } else if (e.code == 'operation-not-allowed') {
        DangKiloi('Lỗi ngoài lề.');
      } else if (e.code == 'weak-password') {
        DangKiloi('Mật khẩu không đủ an toàn. Vui lòng sử dụng mật khẩu khác.');
      } else {
        DangKiloi('Đã có lỗi xảy ra. Vui lòng thử lại sau.');
      }
    } catch (e) {
      // Xử lý các lỗi khác không phải từ FirebaseAuthException
      print('Error during sign-up: $e');
      DangKiloi('Đã có lỗi xảy ra. Vui lòng thử lại sau.');
    }
}
  void signIn(String email,String password, Function onSuccess,Function(String)ErrSignIn) async{
    try{
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password).then((user) {
      //thanh cong
      onSuccess();
    });
    } on FirebaseAuthException catch (e){
      if(e.code != null)
      {
        ErrSignIn('Đăng nhập thất bại. Vui lòng thử lại sau.');
      }
    }catch (e) {
      // Xử lý các lỗi khác không phải từ FirebaseAuthException
      print('Error during sign-up: $e');
      ErrSignIn('Đăng nhập thất bại. Vui lòng thử lại sau.');
    }
  }

  Future<void> _createUser(String userId, String email, String password, Function onSuccess, Function(String) DangKiloi) async {
  var user = {"email": email, "password": password, "uid": userId};
  var ref = FirebaseDatabase.instance.reference().child('users');
  try {
    await ref.child(userId).set(user);
    onSuccess();
  } catch (e) {
    print('Error during user creation: $e');
    DangKiloi('Đăng kí thất bại. Vui lòng thử lại.');
  }
}
}

