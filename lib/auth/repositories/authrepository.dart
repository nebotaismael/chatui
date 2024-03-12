// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:chatui/core/navigation/approuter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:chatui/core/services/service_locator.dart';

class AuthenticationState {
  final bool? isLoggedIn;
  final Map<String, dynamic>? userData;

  const AuthenticationState({this.isLoggedIn, this.userData});
}

abstract class AuthenticationEvent {}

class AppStarted extends AuthenticationEvent {}

class LoginRequested extends AuthenticationEvent {
  final String uid;
  final String? email;
  final String? displayName;
  final String? photoUrl;
  final String? phoneNumber;
  LoginRequested(
      {required this.uid,
      this.email,
      this.displayName,
      this.photoUrl,
      this.phoneNumber});
}

class LogoutRequested extends AuthenticationEvent {}

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final FirebaseAuth _firebaseAuth;
  final SharedPreferencesService _sharedPreferencesService;

  AuthenticationBloc(this._firebaseAuth, this._sharedPreferencesService)
      : super(const AuthenticationState()) {
    on<AppStarted>((event, emit) async {
      final storedData = await _sharedPreferencesService.getCredentials();
      if (storedData == null) {
        navigate('onboard');
      }
      final isLoggedIn = storedData!['status'];

      if (isLoggedIn) {
        navigate('home');
      } else if (!isLoggedIn) {
        navigate('verify');
      }
      emit(AuthenticationState(isLoggedIn: isLoggedIn, userData: storedData));
    });

    on<LoginRequested>((event, emit) async {
      try {
        await _sharedPreferencesService.saveCredentials({
          'uid': event.uid.toString(),
          'email': event.email.toString(),
          'displayName': event.displayName.toString(),
          'photoUrl': event.photoUrl.toString(),
          'phoneNumber': event.phoneNumber.toString(),
          'status': true
        });
        final userData = await _sharedPreferencesService.getCredentials();

        emit(AuthenticationState(isLoggedIn: true, userData: userData));
      } catch (e) {
        print(e.toString());
      }
    });

    on<LogoutRequested>((event, emit) async {
      try {
        await _firebaseAuth.signOut();
        final userData = await _sharedPreferencesService.getCredentials();
        userData!['status'] = false;
        await _sharedPreferencesService.saveCredentials(userData);
        emit(const AuthenticationState(isLoggedIn: false, userData: null));
      } catch (e) {
        print(e);
      }
    });
  }
}
