import "package:flutter/foundation.dart";

@immutable
final class AppRouteName {
  const AppRouteName._();
  // blocked
  static const String blockedPage = "/blocked_page";

  // home
  static const String homePage = "/";
  static const String adDetailsPage = "ad_details_page";
  static const String plans = "/qatnovlar";

  // schedule
  static const String schedulePage = "/schedule_page";

  // profile
  static const String profilePage = "/profile_page";
  static const String settings_car = "/settings_car";
  static const String settings_appearance = "/settings_appearance";
  static const String settings_profile = "/settings_profile";

  // history
  static const String historyPage = "/history_page";

  // Auth
  static const String splash = "/splash";
  static const String language_selection = "/language_selection";

  static const String login_page = "/login";
  static const String register_page = "/register";
  static const String register_auth = "/register_auth";
  static const String register_car = "/register_car";
}
