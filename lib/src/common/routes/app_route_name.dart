import "package:flutter/foundation.dart";

@immutable
final class AppRouteName {
  const AppRouteName._();
  // blocked
  static const String blockedPage = "/blocked_page";

  // home
  static const String homePage = "/";
  static const String filterPage = "filter_page";

  // schedule
  static const String schedulePage = "/schedule_page";

  // profile
  static const String profilePage = "/profile_page";

  // history
  static const String historyPage = "/history_page";

  // Auth
  static const String splash_one = "/splash_one";
  static const String splash_two = "/splash_two";

  static const String login_page = "/login";
  static const String register_page = "/register";
  static const String register_auth = "/register_auth";
  static const String register_car = "/register_car";
}
