import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router_auth/infrastructure/anonymous_class.dart';
import 'package:go_router_auth/infrastructure/auth_controller_provider.dart';
import 'package:go_router_auth/infrastructure/signin_class.dart';
import 'package:go_router_auth/infrastructure/signup_class.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});
  static String get routeName => 'login';
  static String get routeLocation => '/$routeName';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _email = ref.watch(emailProvider);
    final _password = ref.watch(passwordProvider);

    return Scaffold(
      appBar: null,
      body: Center(
        child: Container(
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text("Login Page"),
              SizedBox(height: 20),
              TextField(
                controller: _email,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.shade200,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    )),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _password,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.shade200,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    )),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  ref
                      .read(signUpClassProvider.notifier)
                      .state
                      .signUpUser(_email.text, _password.text, context);
                },
                child: const Text("新規作成"),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () async {
                    ref
                        .read(signInClassProvider.notifier)
                        .state
                        .signInUser(_email.text, _password.text, context);
                  },
                  child: const Text("ログイン")),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () async {
                  ref
                      .read(anonymousClassProvider.notifier)
                      .state
                      .signInAnonymous();
                },
                child: const Text("登録せずに利用"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
