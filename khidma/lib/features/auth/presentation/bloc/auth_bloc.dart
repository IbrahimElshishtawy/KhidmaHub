import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthInitial()) {
    on<AuthLoginRequested>(_onLoginRequested);
    on<AuthGoogleLoginRequested>(_onGoogleLoginRequested);
    on<AuthAppleLoginRequested>(_onAppleLoginRequested);
    on<AuthLogoutRequested>(_onLogoutRequested);
    on<AuthCheckRequested>(_onCheckRequested);
  }

  Future<void> _onLoginRequested(
    AuthLoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());
    try {
      // TODO: Replace with actual repository call
      await Future.delayed(const Duration(seconds: 2));

      // Simulate validation
      if (event.email.isEmpty || event.password.isEmpty) {
        emit(const AuthFailure(message: 'البريد الإلكتروني وكلمة المرور مطلوبان'));
        return;
      }

      if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(event.email)) {
        emit(const AuthFailure(message: 'صيغة البريد الإلكتروني غير صحيحة'));
        return;
      }

      if (event.password.length < 6) {
        emit(const AuthFailure(message: 'كلمة المرور يجب أن تكون 6 أحرف على الأقل'));
        return;
      }

      // Simulate success
      emit(const AuthSuccess(
        userId: 'user_123',
        displayName: 'مستخدم خدمة',
      ));
    } catch (e) {
      emit(AuthFailure(message: e.toString()));
    }
  }

  Future<void> _onGoogleLoginRequested(
    AuthGoogleLoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());
    try {
      // TODO: Integrate Google Sign-In
      await Future.delayed(const Duration(seconds: 2));
      emit(const AuthSuccess(
        userId: 'google_user_123',
        displayName: 'مستخدم Google',
      ));
    } catch (e) {
      emit(AuthFailure(message: e.toString()));
    }
  }

  Future<void> _onAppleLoginRequested(
    AuthAppleLoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());
    try {
      // TODO: Integrate Apple Sign-In
      await Future.delayed(const Duration(seconds: 2));
      emit(const AuthSuccess(
        userId: 'apple_user_123',
        displayName: 'مستخدم Apple',
      ));
    } catch (e) {
      emit(AuthFailure(message: e.toString()));
    }
  }

  Future<void> _onLogoutRequested(
    AuthLogoutRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());
    // TODO: Clear tokens, cache
    await Future.delayed(const Duration(milliseconds: 500));
    emit(const AuthUnauthenticated());
  }

  Future<void> _onCheckRequested(
    AuthCheckRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());
    // TODO: Check stored token validity
    await Future.delayed(const Duration(seconds: 1));
    emit(const AuthUnauthenticated());
  }
}
