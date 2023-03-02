import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router_auth/applications/auth_provider.dart';

final signOutClass = StateProvider<SignOutClass>((ref) => SignOutClass(ref));

class SignOutClass {
  Ref ref;
  SignOutClass(this.ref);

  Future<void> signOut() async {
    await ref.read(firebaseAuthProvider).signOut();
  }
}
