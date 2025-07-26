import 'package:firebase_auth/firebase_auth.dart';  // authentication import

class Auth {
  // firebase authentication instance
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // gets current user
  User? get currentUser => _firebaseAuth.currentUser;

  // updates the user
  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();


  // sign in
  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
  }

  // create account
  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
  }

  // sign out of user
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}