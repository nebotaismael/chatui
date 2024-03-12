import 'package:auto_route/auto_route.dart';
import 'package:chatui/auth/repositories/authrepository.dart';
import 'package:chatui/chat/widgets/appbar.dart';
import 'package:chatui/core/navigation/approuter.dart';
import 'package:chatui/core/utils/getit.dart';
import 'package:chatui/core/utils/popmenu.dart';
import 'package:chatui/main.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class ProfileAccountLight extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = context.read<AuthenticationBloc>();
    final state = bloc.state;
    return Scaffold(
        endDrawer: AppDrawer2(),
        appBar: TopBar(context, 'Profile'),
        body: ProfileScreen(
          showUnlinkConfirmationDialog: true,
          actions: [
            SignedOutAction((context) {
              context.read<AuthenticationBloc>().add(LogoutRequested());
              print('${bloc.state.userData!['uid']}');
              navigate('verify');
            })
          ],
          children: [
            Text('User Id: ${state.userData!['uid']}'),
            SizedBox(height: S.setHeight(15)),
            Text('Status: ${bloc.state.isLoggedIn}'),
            SizedBox(height: S.setHeight(15)),
            Text('Email: ${state.userData!['email']}'), // Display email
            SizedBox(height: S.setHeight(15)),
            Text(
                'Display Name: ${state.userData!['displayName']}'), // Display name
            SizedBox(height: S.setHeight(15)),
            Text(
                'Photo URL: ${state.userData!['photoUrl']}'), // Display photo URL
            SizedBox(height: S.setHeight(15)),
            Text('Phone Number: ${state.userData!['phoneNumber']}'),
          ],
        ));
  }
}
