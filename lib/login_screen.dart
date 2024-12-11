import 'package:flutter/material.dart';
import 'package:ts_firebase_auth/login_repository.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final LoginRepository repository = LoginRepository();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder(
              stream: repository.onAuthStateChanged,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text('${repository.getUser()?.email} ist eingeloggt');
                } else {
                  return const Text('User ausgeloggt');
                }
              },
            ),
            ElevatedButton(
                onPressed: () {
                  repository.loginUser('sascha@aa.de', 'baum123');
                },
                child: const Text('Login')),
            ElevatedButton(
                onPressed: () {
                  repository.logoutUser();
                },
                child: const Text('Logout')),
          ],
        ),
      ),
    );
  }
}
