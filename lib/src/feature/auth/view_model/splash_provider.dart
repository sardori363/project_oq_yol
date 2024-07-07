import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import "../../../common/routes/app_route_name.dart";
import "../../../common/routes/app_router.dart";

final Provider<GoRouter> navigationProvider = Provider<GoRouter>((ProviderRef<GoRouter> ref) {
  return AppRouter.router;
});

final Provider<void> splashProvider = Provider<void>((ProviderRef<void> ref) {
  Future.delayed(const Duration(seconds: 3), () {
    ref.read(navigationProvider).go(AppRouteName.homePage); // Use the navigation provider
  });
});
