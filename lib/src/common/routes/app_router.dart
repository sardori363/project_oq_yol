import "package:flutter/material.dart";
import "package:go_router/go_router.dart";

import "../../feature/auth/presentation/pages/splash_one.dart";
import "../../feature/auth/presentation/pages/splash_two.dart";
import "../../feature/home/presentation/pages/home_page_new.dart";
import "../../feature/main/presentation/pages/main_page.dart";
import "app_route_name.dart";


@immutable
class AppRouter {
  factory AppRouter() => _router;

  const AppRouter._internal();

  static const AppRouter _router = AppRouter._internal();

  static final GoRouter router = GoRouter(
    initialLocation: AppRouteName.splash_one,
    // navigatorKey: rootNavigatorKey,
    debugLogDiagnostics: true,
    routes: <RouteBase>[
      GoRoute(
        name: "splash_one",
        path: AppRouteName.splash_one,
        builder: (BuildContext context, GoRouterState state) {
          return const SplashOne();
        },
      ),GoRoute(
        name: "splash_two",
        path: AppRouteName.splash_two,
        builder: (BuildContext context, GoRouterState state) {
          return const SplashTwo();
        },
      ),
      ShellRoute(
        builder: (BuildContext context, GoRouterState state, Widget child) {
          return MainPage(
            child: child,
          );
        },
        // navigatorKey: shellNavigatorKey,
        // parentNavigatorKey: rootNavigatorKey,
        routes: <RouteBase>[
          GoRoute(
            name: "HomePage",
            path: AppRouteName.homePage,
            builder: (BuildContext context, GoRouterState state) {
              return const HomePage();
            },
          ),
        ],
      ),
    ],
  );
}

@immutable
final class BlockedRouter {
  factory BlockedRouter() => _router;

  const BlockedRouter._internal();

  static const BlockedRouter _router = BlockedRouter._internal();

  static final GoRouter router = GoRouter(
    initialLocation: AppRouteName.blockedPage,
    debugLogDiagnostics: true,
    routes: <RouteBase>[
      GoRoute(
        name: "BlockedPage",
        path: AppRouteName.blockedPage,
        builder: (BuildContext context, GoRouterState state) {
          return const Scaffold(
            body: Center(
              child: Text("App is permanently blocked !!!"),
            ),
          );
        },
      ),
    ],
  );
}
