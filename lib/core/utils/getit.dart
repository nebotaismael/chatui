import 'package:chatui/auth/repositories/authrepository.dart';
import 'package:chatui/core/navigation/approuter.dart';
import 'package:chatui/core/services/service_locator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

final servicelocator = GetIt.instance;

void configureDependencies() async {
  servicelocator
      .registerSingleton<SharedPreferencesService>(SharedPreferencesService());
  servicelocator
      .registerSingleton<AuthenticationBloc>(AuthenticationBloc(
        FirebaseAuth.instance,
        servicelocator<SharedPreferencesService>(),
      ))
      .add(AppStarted());

  servicelocator.registerSingleton<AppRouter>(AppRouter());
}

final sharepreference = servicelocator<SharedPreferencesService>();
