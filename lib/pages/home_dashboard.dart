import 'package:auto_route/auto_route.dart';
import 'package:chatui/auth/repositories/authrepository.dart';
import 'package:chatui/core/navigation/approuter.dart';
import 'package:chatui/core/navigation/approuter.gr.dart';
import 'package:chatui/core/navigation/bottom_nav.dart';
import 'package:chatui/core/navigation/bottom_nav_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

@RoutePage()
class HomeDashboardScreen extends StatelessWidget {
  const HomeDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavProvider>(builder: (_, provider, __) {
      return AutoTabsRouter(
          routes: const [
            ContactsLight(),
            ChatsLight(),
            ProfileAccountLight(),
          ],
          builder: (ctx, child) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              provider.init(ctx);
            });

            return Scaffold(
              backgroundColor: const Color(0xF7F5F5F5),
              bottomNavigationBar: const CustomBottomNavBar(),
              body: child,
            );
          });
    });
  }
}
