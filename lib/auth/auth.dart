import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_chat_app/utils/show_toast.dart';

class Auth {
  final FirebaseAuth currentUser = FirebaseAuth.instance;
  String loginError = '';
  String registrationError = '';
  User? user;

  Stream<User?> get authStateChanges => currentUser.authStateChanges();

  Future<void> registerUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    registrationError = '';

    try {
      final credential = await currentUser.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (!credential.user!.emailVerified) {
        await credential.user!.sendEmailVerification();
        showToast(
          title: "Email Verification",
          message:
              "A verification link has been sent to your email. Please verify your email to continue.",
          isError: false,
        );
      }
    } on FirebaseAuthException catch (e) {
      handleRegistrationError(e);
      showToast(
        title: "Registration Failed",
        message: registrationError,
        isError: true,
      );
    } catch (e) {
      showToast(
        title: "Registration Failed",
        message: "An unexpected error occurred. Please try again.",
        isError: true,
      );
    }
  }

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    loginError = '';
    try {
      final credential = await currentUser.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (!credential.user!.emailVerified) {
        loginError = 'Please verify your email before logging in.';
        showToast(title: "Login Error", message: loginError, isError: true);
        return;
      }
      user = !credential.user!.emailVerified ? null : credential.user!;
      showToast(
          title: "Login Successful",
          message: "Successfully logged in.",
          isError: false);
    } on FirebaseAuthException catch (e) {
      handleSignInError(e);
      showToast(title: "Login Failed", message: loginError, isError: true);
    }
  }

  Future<void> signOut() async {
    try {
      await currentUser.signOut();
      showToast(
          title: "Logged out",
          message: "successfully logged out.",
          isError: false);
      user = null;
    } catch (e) {
      showToast(title: "Error", message: e.toString(), isError: true);
    }
  }

  void handleSignInError(FirebaseAuthException e) {
    switch (e.code) {
      case 'invalid-email':
      case 'wrong-password':
        loginError = 'Incorrect email or password';
        break;
      case 'user-disabled':
        loginError = 'User account is disabled';
        break;
      case 'user-not-found':
        loginError = 'No user found with this email';
        break;
      default:
        loginError = 'An unknown error occurred';
    }
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
  }

  // void onAuthStateChanges() {
  //   FirebaseAuth.instance.userChanges().listen((User? user) {
  //     if (user == null) {
  //       state = UserData();
  //     } else {
  //       final userData = UserData(
  //         email: user.email,
  //         emailVerified: user.emailVerified,
  //         phoneNumber: user.phoneNumber,
  //         photoURL: user.photoURL,
  //         uid: user.uid,
  //         isAnonymous: user.isAnonymous,
  //         displayName: user.displayName,
  //       );
  //       state = userData;
  //     }
  //   });
  // }
}

// final authStateProvider = StateNotifierProvider<Auth, UserData>(
//   (ref) => Auth(),
// );

// // Usage in widgets
