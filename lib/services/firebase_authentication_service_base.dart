import 'package:firebase_auth/firebase_auth.dart';

abstract class FirebaseAuthenticationServiceBase {
  Stream<User?> get userAuthStateChanges;
}