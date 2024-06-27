import 'package:firebase_auth/firebase_auth.dart';
import 'package:keiko_food_reviews/services/authentication_service_base.dart';
import 'package:keiko_food_reviews/services/firebase_authentication_service_base.dart';

class FirebaseAuthenticationService implements FirebaseAuthenticationServiceBase, AuthenticationServiceBase<User, String> {
  @override
  Stream<User?> get userAuthStateChanges => FirebaseAuth.instance.authStateChanges();

  @override
  String? getCurrentUserUid() => FirebaseAuth.instance.currentUser?.uid;

  @override
  Future<User?> createUserWithEmailAndPassword({required String email, required String password}) {
    return FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password)
        .then((userCredentials) => userCredentials.user)
        .onError((FirebaseAuthException error, stackTrace) => Future.error(error.code));
  }

  @override
  Future<User?> signInWithEmailAndPassword({required String email, required String password}) {
    return FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password)
        .then((userCredentials) => userCredentials.user)
        .onError((FirebaseAuthException error, stackTrace) => Future.error(error.code));
  }

  @override
  Future<bool> sendPasswordReset(String email) {
    return FirebaseAuth.instance.sendPasswordResetEmail(email: email)
        .then((value) => true)
        .onError((FirebaseAuthException error, stackTrace) => Future.error(error.code));
  }

  @override
  Future<void> sendEmailVerification() async {
    FirebaseAuth.instance.currentUser?.sendEmailVerification();
  }

  @override
  Future<bool?> isEmailVerified() async {
    return FirebaseAuth.instance.currentUser?.emailVerified;
  }

  @override
  Future<void> signOut() => FirebaseAuth.instance.signOut();

  @override
  Future<User?> getCurrentUser() async => FirebaseAuth.instance.currentUser;
}