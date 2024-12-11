import 'dart:developer' as dev;

import 'package:firebase_auth/firebase_auth.dart';

class LoginRepository {
  final authInstance = FirebaseAuth.instance;

  Stream<User?> get onAuthStateChanged => authInstance.authStateChanges();

  /// Login
  Future<void> loginUser(String email, String password) async {
    try {
      await authInstance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      dev.log("$e");
    }
  }

  /// Logout
  Future<void> logoutUser() async {
    try {
      await authInstance.signOut();
    } catch (e) {
      dev.log("$e");
    }
  }

// eingelogter User
    User? getUser() {
    return authInstance.currentUser;
  }
}
