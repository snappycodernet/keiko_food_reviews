abstract class AuthenticationServiceBase<USER_TYPE, USER_ID_TYPE> {
  USER_ID_TYPE? getCurrentUserUid();
  Future<USER_TYPE?> getCurrentUser();
  Future<USER_TYPE?> createUserWithEmailAndPassword({required String email, required String password});
  Future<USER_TYPE?> signInWithEmailAndPassword({required String email, required String password});
  Future<bool> sendPasswordReset(String email);
  Future<void> sendEmailVerification();
  Future<bool?> isEmailVerified();
  Future<void> signOut();
}