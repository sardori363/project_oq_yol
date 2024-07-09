import "package:flutter/material.dart";
import "package:go_router/go_router.dart";

import "../../../../../../generated/assets.dart";
import "../../../../../common/routes/app_route_name.dart";
import "../../../../../common/utils/extensions/context_extensions.dart";
import "../../widgets/loading_animation.dart";

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {

    Future<void>.delayed(const Duration(seconds: 3), () {
      context.go(AppRouteName.language_selection);
    });

    return Scaffold(
      backgroundColor: const Color(0xfff3f3f3),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Image.asset(Assets.imagesLogonew),
        ),
      ),
      floatingActionButton:
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: SplashLoadingAnimation(color: context.theme.colorScheme.primary, size: 50,),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
