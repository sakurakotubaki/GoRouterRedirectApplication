import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../applications/auth_provider.dart';

final signInClassProvider =
    StateProvider<SignInClass>((ref) => SignInClass(ref));

class SignInClass {
  Ref ref;
  SignInClass(this.ref);

  Future<void> signInUser(
      String _email, String _password, BuildContext context) async {
    try {
      final newUser = await ref
          .read(firebaseAuthProvider)
          .signInWithEmailAndPassword(email: _email, password: _password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('メールアドレスのフォーマットが正しくありません'),
          ),
        );
        print('メールアドレスのフォーマットが正しくありません');
      } else if (e.code == 'user-disabled') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('現在指定したメールアドレスは使用できません'),
          ),
        );
        print('現在指定したメールアドレスは使用できません');
      } else if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('指定したメールアドレスは登録されていません'),
          ),
        );
        print('指定したメールアドレスは登録されていません');
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('パスワードが間違っています'),
          ),
        );
        print('パスワードが間違っています');
      }
    }
  }
}
