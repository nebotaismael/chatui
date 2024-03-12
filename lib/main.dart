import 'package:auto_route/auto_route.dart';

import 'package:chatui/auth/repositories/authrepository.dart';
import 'package:chatui/core/navigation/approuter.dart';
import 'package:chatui/core/navigation/bottom_nav_provider.dart';
import 'package:chatui/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:chatui/core/utils/getit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  configureDependencies();

  runApp(MyApp());
  FirebaseUIAuth.configureProviders([PhoneAuthProvider(), EmailAuthProvider()]);
}

final S = ScreenUtil();

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      builder: (context, child) {
        final blc = context.watch<AuthenticationBloc>();

        print('login state is ${blc.state.isLoggedIn}');

        return ScreenUtilInit(
          designSize: MediaQuery.of(context).size,
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              routerDelegate: servicelocator<AppRouter>().delegate(),
              routeInformationParser:
                  servicelocator<AppRouter>().defaultRouteParser(),
              theme: ThemeData(primarySwatch: Colors.blue),
            );
          },
        );
      },

      // Wrap with MultiProvider
      providers: [
        BlocProvider<AuthenticationBloc>(
          create: (context) => servicelocator<AuthenticationBloc>(),
        ),
        ChangeNotifierProvider(create: ((context) => BottomNavProvider()))

        // ... add other providers if you have more dependencies
      ],
    );
  }
}
