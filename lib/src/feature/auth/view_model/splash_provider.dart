import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import "../../../common/routes/app_route_name.dart";
import "../../../common/routes/app_router.dart";

final Provider<GoRouter> navigationProvider = Provider<GoRouter>((ProviderRef<GoRouter> ref) {
  return AppRouter.router;
});

final Provider<void> splashProvider = Provider<void>((ProviderRef<void> ref) {
  Future.delayed(const Duration(seconds: 3), () {
    ref.read(navigationProvider).go(AppRouteName.login_page); // Use the navigation provider
  });
});

final Provider<bool> passwordVisibleProvider = Provider<bool>((ProviderRef<bool> ref) => false);
