import 'package:auto_route/auto_route.dart';
import 'package:chatui/core/navigation/approuter.dart';
import 'package:chatui/core/navigation/bottom_nav_provider.dart';
import 'package:chatui/core/utils/getit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomNavigate {
  static BuildContext? get currentContext =>
      servicelocator<AppRouter>().navigatorKey.currentContext;
  static Future<dynamic> push(PageRouteInfo<dynamic> route) async {
    return await servicelocator<AppRouter>().push(route);
  }

  static Future<dynamic> navigate(PageRouteInfo<dynamic> route) async {
    return await servicelocator<AppRouter>().navigate(route);
  }

  static Future<dynamic> replaceAll(List<PageRouteInfo<dynamic>> routes) async {
    return await servicelocator<AppRouter>().replaceAll(routes);
  }

  static Future<dynamic> pop(BuildContext context) {
    return context.router.pop();
  }

  static void popRoot(BuildContext context) {
    Navigator.of(context, rootNavigator: true).pop();
  }

  Future<dynamic> pushIndex(PageRouteInfo<dynamic> route, int index) async {
    currentContext!.read<BottomNavProvider>().onIndexChange(index);
    return await servicelocator<AppRouter>().push(route);
  }

  void changeIndex(int index) {
    currentContext!.read<BottomNavProvider>().onIndexChange(index);
  }
}
