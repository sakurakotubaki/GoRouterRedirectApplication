import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// メールアドレスのテキストを保存するProvider
final emailProvider = StateProvider.autoDispose((ref) {
  return TextEditingController(text: '');
});

/// パスワードのテキストを保存するProvider
final passwordProvider = StateProvider.autoDispose((ref) {
  return TextEditingController(text: '');
});
