// auth/providers/auth_provider.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';

final authStateProvider = StateNotifierProvider<AuthNotifier, AuthState>(
  (ref) => AuthNotifier(ref.read(authDataSourceProvider)),
);

class AuthState {
  const AuthState({
    this.user,
    this.isLoading = false,
    this.error,
  });

  final User? user;
  final bool isLoading;
  final String? error;

  AuthState copyWith({
    User? user,
    bool? isLoading,
    String? error,
  }) {
    return AuthState(
      user: user ?? this.user,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthDataSource authDataSource;

  AuthNotifier(this.authDataSource) : super(const AuthState());

  Future<void> login(String email, String password) async {
    state = const AuthState(isLoading: true);
    try {
      await authDataSource.login(email, password);
      state = AuthState(
          user: User.fromFirebaseUser(FirebaseAuth.instance.currentUser!));
    } catch (e) {
      state = AuthState(error: e.toString());
    }
  }

  Future<void> signup(String email, String password) async {
    state = const AuthState(isLoading: true);
    try {
      await authDataSource.signup(email, password);
      state = AuthState(
          user: User.fromFirebaseUser(FirebaseAuth.instance.currentUser!));
    } catch (e) {
      state = AuthState(error: e.toString());
    }
  }

  Future<void> googleLogin() async {
    state = const AuthState(isLoading: true);
    try {
      await authDataSource.googleLogin();
      state = AuthState(
          user: User.fromFirebaseUser(FirebaseAuth.instance.currentUser!));
    } catch (e) {
      state = AuthState(error: e.toString());
    }
  }

  void logout() {
    authDataSource.logout();
    state = const AuthState();
  }
}
