import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_chat_app/utils/show_toast.dart';

class Auth {
  final _firebaseAuth = FirebaseAuth.instance;

  String loginError = '';
  String registrationError = '';
  User? get currentUser => _firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    loginError = '';
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      showToast(
          title: "Login Failed",
          message: "successfully logged in.",
          isError: false);
    } on FirebaseAuthException catch (e) {
      handleSignInError(e);
      showToast(title: "Login", message: loginError, isError: true);
    }
  }

  Future<void> registerUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    registrationError = '';
    try {
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      showToast(
          title: "Registration",
          message: "successfully registered.",
          isError: false);
    } on FirebaseAuthException catch (e) {
      handleRegistrationError(e);
      showToast(
          title: "Registration Failed",
          message: registrationError,
          isError: true);
    }
  }

  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
      if (currentUser != null) {
        showToast(
            title: "Logged out",
            message: "successfully logged out.",
            isError: false);
      }
    } catch (e) {
      showToast(title: "Error", message: e.toString(), isError: true);
    }
  }

  void handleSignInError(FirebaseAuthException e) {
    switch (e.code) {
      case 'invalid-email':
        loginError = 'Invalid email address';
        break;
      case 'user-disabled':
        loginError = 'User account is disabled';
        break;
      case 'user-not-found':
        loginError = 'No user found with this email';
        break;
      case 'wrong-password':
        loginError = 'Incorrect password';
        break;
      default:
        loginError = 'An unknown error occurred';
    }
    loginError;
  }

  void handleRegistrationError(FirebaseAuthException e) {
    switch (e.code) {
      case 'email-already-in-use':
        registrationError = 'Account already exists for this email';
        break;
      case 'weak-password':
        registrationError = 'Password is too weak';
        break;
      case 'network-request-failed':
        registrationError = 'Network request failed';
        break;
      default:
        registrationError = 'An unknown error occurred during registration';
    }
    registrationError;
  }
}
