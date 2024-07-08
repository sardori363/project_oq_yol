import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";

import "../../../../../../generated/assets.dart";
import "../../../../../common/styles/app_colors.dart";
import "../../../view_model/splash_provider.dart";

class SplashTwo extends ConsumerWidget {
  const SplashTwo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(splashProvider);

    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.imagesTaxiSplash),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            const Text(
              "OQ YO'L",
              style: TextStyle(
                fontSize: 48,
                color: AppColors.yellow,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              "O’zbekiston bo’ylab eng yaxshi taksi\nxizmati faqat siz uchun!",
              style: TextStyle(
                fontSize: 16,
                color: AppColors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 120.h),
          ],
        ),
      ),
    );
  }
}
