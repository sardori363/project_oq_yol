import "package:flutter/material.dart";
import "package:go_router/go_router.dart";

import "../../feature/auth/presentation/pages/login_page.dart";
import "../../feature/auth/presentation/pages/register/register_auth.dart";
import "../../feature/auth/presentation/pages/register/register_car.dart";
import "../../feature/auth/presentation/pages/register/register_page.dart";
import "../../feature/auth/presentation/pages/splash/splash.dart";
import "../../feature/auth/presentation/pages/splash/language_selection.dart";
import "../../feature/history/presentation/pages/history_page.dart";
import "../../feature/home/presentation/pages/home_page.dart";
import "../../feature/main/presentation/pages/main_page.dart";
import "../../feature/profile/presentation/pages/profile_page.dart";
import "../../feature/profile/presentation/pages/settings/appereance.dart";
import "../../feature/profile/presentation/pages/settings/car.dart";
import "../../feature/profile/presentation/pages/settings/settings_profile.dart";
import "../../feature/schedule/presentation/pages/schedule_page.dart";
import "app_route_name.dart";


@immutable
class AppRouter {
  factory AppRouter() => _router;

  const AppRouter._internal();

  static const AppRouter _router = AppRouter._internal();

  static final GoRouter router = GoRouter(
    initialLocation: AppRouteName.splash,
    // navigatorKey: rootNavigatorKey,
    debugLogDiagnostics: true,
    routes: <RouteBase>[
      // Auth
      GoRoute(
        name: "splash_one",
        path: AppRouteName.splash,
        builder: (BuildContext context, GoRouterState state) {
          return const SplashPage();
        },
      ),
      GoRoute(
        name: "splash_two",
        path: AppRouteName.language_selection,
        builder: (BuildContext context, GoRouterState state) {
          return const LanguageSelection();
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
      GoRoute(
        name: "register_car",
        path: AppRouteName.register_car,
        builder: (BuildContext context, GoRouterState state) {
          return const RegisterCar();
        },
      ),

      //Setting in Profile
      GoRoute(
        name: "settings_profile",
        path: AppRouteName.settings_profile,
        builder: (BuildContext context, GoRouterState state) {
          return const SettingsProfile();
        },
      ),
      GoRoute(
        name: "settings_car",
        path: AppRouteName.settings_car,
        builder: (BuildContext context, GoRouterState state) {
          return const SettingsCar();
        },
      ),
      GoRoute(
        name: "settings_appearance",
        path: AppRouteName.settings_appearance,
        builder: (BuildContext context, GoRouterState state) {
          return const SettingsAppearance();
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
