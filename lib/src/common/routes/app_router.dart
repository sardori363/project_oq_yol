import "package:flutter/material.dart";
import "package:go_router/go_router.dart";

import "../../feature/auth/presentation/pages/login_page.dart";
import "../../feature/auth/presentation/pages/register/register_auth.dart";
import "../../feature/auth/presentation/pages/register/register_page.dart";
import "../../feature/auth/presentation/pages/splash/splash_one.dart";
import "../../feature/auth/presentation/pages/splash/splash_two.dart";
import "../../feature/history/presentation/pages/history_page.dart";
import "../../feature/home/presentation/pages/home_page.dart";
import "../../feature/main/presentation/pages/main_page.dart";
import "../../feature/profile/presentation/pages/profile_page.dart";
import "../../feature/schedule/presentation/pages/schedule_page.dart";
import "app_route_name.dart";


@immutable
class AppRouter {
  factory AppRouter() => _router;

  const AppRouter._internal();

  static const AppRouter _router = AppRouter._internal();

  static final GoRouter router = GoRouter(
    initialLocation: AppRouteName.register_page,
    // navigatorKey: rootNavigatorKey,
    debugLogDiagnostics: true,
    routes: <RouteBase>[
      // Auth
      GoRoute(
        name: "splash_one",
        path: AppRouteName.splash_one,
        builder: (BuildContext context, GoRouterState state) {
          return const SplashOne();
        },
      ),
      GoRoute(
        name: "splash_two",
        path: AppRouteName.splash_two,
        builder: (BuildContext context, GoRouterState state) {
          return const SplashTwo();
        },
      ),
      GoRoute(
        name: "login_page",
        path: AppRouteName.login_page,
        builder: (BuildContext context, GoRouterState state) {
          return const LoginPage();
        },
      ),
      GoRoute(
        name: "register_page",
        path: AppRouteName.register_page,
        builder: (BuildContext context, GoRouterState state) {
          return const RegisterPage();
        },
      ),
      GoRoute(
        name: "register_auth",
        path: AppRouteName.register_auth,
        builder: (BuildContext context, GoRouterState state) {
          return const RegisterAuth();
        },
      ),

      // Main
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
          GoRoute(
            name: "SchedulePage",
            path: AppRouteName.schedulePage,
            builder: (BuildContext context, GoRouterState state) {
              return const SchedulePage();
            },
          ),
          GoRoute(
            name: "HistoryPage",
            path: AppRouteName.historyPage,
            builder: (BuildContext context, GoRouterState state) {
              return const HistoryPage();
            },
          ),
          GoRoute(
            name: "ProfilePage",
            path: AppRouteName.profilePage,
            builder: (BuildContext context, GoRouterState state) {
              return const ProfilePage();
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
