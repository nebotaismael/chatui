// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i11;
import 'package:chatui/auth/widgets/login.dart' as _i6;

import 'package:chatui/pages/chatlist.dart' as _i2;
import 'package:chatui/pages/contactslist.dart' as _i3;
import 'package:chatui/pages/home_dashboard.dart' as _i4;
import 'package:chatui/pages/more.dart' as _i7;
import 'package:chatui/pages/profileaccoun.dart' as _i8;
import 'package:chatui/pages/start.dart' as _i10;
import 'package:chatui/pages/verification.dart' as _i9;
import 'package:flutter/material.dart' as _i12;

abstract class $AppRouter extends _i11.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i11.PageFactory> pagesMap = {
    ChatsLight.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.ChatsLight(),
      );
    },
    ContactsLight.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.ContactsLight(),
      );
    },
    HomeDashboardRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.HomeDashboardScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.LoginScreen(),
      );
    },
    MoreLight.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.MoreLight(),
      );
    },
    ProfileAccountLight.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.ProfileAccountLight(),
      );
    },
    VerificationLight.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.VerificationLight(),
      );
    },
    WalkthroughLight.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i10.WalkthroughLight(),
      );
    },
  };
}

/// generated route for
/// [_i1.ChatScreen]
class ChatRoute extends _i11.PageRouteInfo<void> {
  const ChatRoute({List<_i11.PageRouteInfo>? children})
      : super(
          ChatRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChatRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i2.ChatsLight]
class ChatsLight extends _i11.PageRouteInfo<void> {
  const ChatsLight({List<_i11.PageRouteInfo>? children})
      : super(
          ChatsLight.name,
          initialChildren: children,
        );

  static const String name = 'ChatsLight';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i3.ContactsLight]
class ContactsLight extends _i11.PageRouteInfo<void> {
  const ContactsLight({List<_i11.PageRouteInfo>? children})
      : super(
          ContactsLight.name,
          initialChildren: children,
        );

  static const String name = 'ContactsLight';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i4.HomeDashboardScreen]
class HomeDashboardRoute extends _i11.PageRouteInfo<void> {
  const HomeDashboardRoute({List<_i11.PageRouteInfo>? children})
      : super(
          HomeDashboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeDashboardRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i5.HomeScreen]
class HomeRoute extends _i11.PageRouteInfo<HomeRouteArgs> {
  HomeRoute({
    _i12.Key? key,
    List<_i11.PageRouteInfo>? children,
  }) : super(
          HomeRoute.name,
          args: HomeRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i11.PageInfo<HomeRouteArgs> page =
      _i11.PageInfo<HomeRouteArgs>(name);
}

class HomeRouteArgs {
  const HomeRouteArgs({this.key});

  final _i12.Key? key;

  @override
  String toString() {
    return 'HomeRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i6.LoginScreen]
class LoginRoute extends _i11.PageRouteInfo<void> {
  const LoginRoute({List<_i11.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i7.MoreLight]
class MoreLight extends _i11.PageRouteInfo<void> {
  const MoreLight({List<_i11.PageRouteInfo>? children})
      : super(
          MoreLight.name,
          initialChildren: children,
        );

  static const String name = 'MoreLight';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i8.ProfileAccountLight]
class ProfileAccountLight extends _i11.PageRouteInfo<void> {
  const ProfileAccountLight({List<_i11.PageRouteInfo>? children})
      : super(
          ProfileAccountLight.name,
          initialChildren: children,
        );

  static const String name = 'ProfileAccountLight';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i9.VerificationLight]
class VerificationLight extends _i11.PageRouteInfo<void> {
  const VerificationLight({List<_i11.PageRouteInfo>? children})
      : super(
          VerificationLight.name,
          initialChildren: children,
        );

  static const String name = 'VerificationLight';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i10.WalkthroughLight]
class WalkthroughLight extends _i11.PageRouteInfo<void> {
  const WalkthroughLight({List<_i11.PageRouteInfo>? children})
      : super(
          WalkthroughLight.name,
          initialChildren: children,
        );

  static const String name = 'WalkthroughLight';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}
