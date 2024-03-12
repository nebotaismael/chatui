import 'dart:convert';

import 'package:chatui/auth/repositories/authrepository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppDrawer2 extends StatefulWidget {
  const AppDrawer2({super.key});

  @override
  State<AppDrawer2> createState() => _AppDrawer2State();
}

class _AppDrawer2State extends State<AppDrawer2> {
  Map? userData;

  @override
  void initState() {
    super.initState();
  }

  bool darkthemeison = false;
  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<AuthenticationBloc>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nebota Ismael'),
      ),
      body: Drawer(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(
                  color: Colors.blue,
                ),
                child: Center(
                  child: ListTile(
                    leading: GestureDetector(
                      onTap: () {},
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        //  radius: 50,
                      ),
                    ),
                    title: Text(bloc.state.userData!['displayName']),
                    subtitle: Text('Registered'),
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text('Home'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.group),
                title: const Text('Contacts'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Settings'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.info_outline),
                title: const Text('About'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('Logout'),
                onTap: () {
                  // Add logout functionality linked to your AuthenticationBloc
                },
              ),
            ],
          ) // Add more ListTile widgets for additional drawer items
        ],
      )),
    );
  }
}
