import 'package:auto_route/auto_route.dart';

import 'package:get_it/get_it.dart';

import 'approuter.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page|Screen,Route')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        MaterialRoute(page: ChatsLight.page, path: '/chat'),
        AutoRoute(page: HomeDashboardRoute.page, path: '/home', children: [
          AutoRoute(
            page: ContactsLight.page,
            path: 'home-dashboard',
            maintainState: true,
          ),
          AutoRoute(page: ChatsLight.page, maintainState: true, initial: true),
          AutoRoute(
            page: ProfileAccountLight.page,
            path: 'settings-dashboard',
            maintainState: true,
          ),
        ]),
        MaterialRoute(page: WalkthroughLight.page, path: '/onboard'),
        MaterialRoute(page: VerificationLight.page, path: '/verify'),
        MaterialRoute(page: ContactsLight.page, path: '/contacts'),
        MaterialRoute(page: ProfileAccountLight.page, path: '/profile'),
        MaterialRoute(page: MoreLight.page, path: '/more'),
        MaterialRoute(page: LoginRoute.page, path: '/', initial: true)

        // ... add more routes here
      ];
}

navigate(String routeName) {
  GetIt.I<AppRouter>().pushNamed('/$routeName');
}
