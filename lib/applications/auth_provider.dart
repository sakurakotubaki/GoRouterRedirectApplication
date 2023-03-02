import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// firebaseの場合、シンプルなプロバイダを書くことが多いです。
//
// 通常はストリームベースのリダイレクトで十分すぎるほどです。
//
// Auth関連のロジックのほとんどはSDKで処理される
final authProvider = StreamProvider<User?>((ref) {
  return FirebaseAuth.instance.authStateChanges();
});

/// FirebaseAuthを外部ファイルで使うためのプロバイダー.
final firebaseAuthProvider =
    Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);

// カスタムロジックやノーティファイアを追加することも可能です。
//
// 個人的には複雑にしすぎるのは好きではないのですが、限界はありますよね！？
