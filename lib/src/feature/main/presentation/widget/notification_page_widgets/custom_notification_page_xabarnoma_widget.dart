import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:flutter_svg/svg.dart";

import "../../../../../../generated/assets.dart";
import "../../../../../common/utils/extensions/context_extensions.dart";

class CustomNotificationPageXabarnomaWidget extends StatelessWidget {
  const CustomNotificationPageXabarnomaWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      elevation: 0,
      color: context.theme.colorScheme.secondaryContainer,
      surfaceTintColor: context.theme.colorScheme.secondaryContainer,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(12.r)),
              child: Image.asset(
                fit: BoxFit.cover,
                Assets.imagesNotificationPageDraftImage,
              )),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Hurmatli investorlar va do‘stlar!",
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: context.theme.colorScheme.onSecondaryContainer,
                      fontWeight: FontWeight.w500,
                      fontFamily: "SF-Pro",
                      fontSize: 20.sp),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  "Bugun bizning IT maktabimizning qurilish jarayoni rasmiy ravishda boshlandi. Bu katta qadam bizning kelajakdagi o'quvchilarimiz uchun eng yaxshi ta'lim muhitini yaratish yo'lidagi muhim bosqichdir. Sizlarning yordamingiz va ishonchingiz tufayli bu loyihani amalga oshiryapmiz. Yaqin orada yangiliklar bilan bo'lishib turamiz!",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: context.theme.colorScheme.onSecondaryContainer, fontSize: 18.sp, fontWeight: FontWeight.w300),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  "Eng yaxshi tilaklar bilan,\nJiemurat Aka Mambetkarimov",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: context.theme.colorScheme.onSecondaryContainer,
                      fontFamily: "SF-Pro",
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w300),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "23.04.2024 / 23:24",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: context.theme.colorScheme.onTertiary, fontSize: 15.sp, fontWeight: FontWeight.w200),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
              ],
            ),
          ),
          Divider(
            thickness: 0.6.h,
            height: 1.h,
            endIndent: 15.w,
            indent: 15.w,
          ),
          ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(12.r)),
            ),
            onTap: () {},
            leading: SvgPicture.asset(Assets.iconsNotificationPageTelegram),
            title: Text(
              context.localized.go_to_telegram,
              style:
                  Theme.of(context).textTheme.bodyMedium?.copyWith(color: const Color(0xff3190FF), fontFamily: "SF-Pro", fontSize: 18.sp),
            ),
            trailing: Icon(
              size: 30.h,
              weight: 10,
              Icons.navigate_next_outlined,
              color: context.theme.colorScheme.onTertiary,
            ),
          )
        ],
      ),
    );
  }
}
