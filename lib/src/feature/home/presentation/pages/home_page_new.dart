import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:flutter_svg/flutter_svg.dart";

import "../../../../../generated/assets.dart";
import "../../../../common/utils/extensions/context_extensions.dart";

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ColorScheme contextColor = context.theme.colorScheme;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  width: 300.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: contextColor.primaryContainer)
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                      icon: SvgPicture.asset(Assets.iconsSearchZoomIn),
                      border: InputBorder.none,
                      hintText: "Qidirish...",
                      hintFadeDuration: const Duration(milliseconds: 300),
                      hintStyle: TextStyle(color: contextColor.primaryContainer, fontSize: 14, fontWeight: FontWeight.w400, fontFamily: "Poppins"),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: (){},
                  style: TextButton.styleFrom(
                    minimumSize: const Size(40, 40),
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    side: BorderSide(color: contextColor.primaryContainer),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  ),
                  child: SvgPicture.asset(Assets.iconsFilter),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
