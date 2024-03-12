import 'package:auto_route/auto_route.dart';
import 'package:chatui/auth/repositories/authrepository.dart';
import 'package:chatui/core/navigation/approuter.dart';
import 'package:flutter/material.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class VerificationLight extends StatelessWidget {
  const VerificationLight({super.key});

  @override
  Widget build(BuildContext context) {
    return SignInScreen(
      actions: [
        AuthStateChangeAction<SignedIn>((context, state) async {
          context.read<AuthenticationBloc>().add(LoginRequested(
                uid: state.user!.uid,
                phoneNumber: state.user?.phoneNumber,
                displayName: state.user?.displayName,
                photoUrl: state.user?.photoURL,
                email: state.user!.email!,
              ));
          navigate('home');
        }),
      ],
    );
  }
}
