import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:flutter_svg/svg.dart";

import "../../../../generated/assets.dart";
import "../../../feature/home/view_model/home_vm.dart";
import "../../utils/extensions/context_extensions.dart";

class NotificationSwitcher extends ConsumerWidget {
  const NotificationSwitcher({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final HomeVM con = ref.watch(homeVM);
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            SvgPicture.asset(
              Assets.iconsNotification,
              height: 30.h,
              width: 30.w,
            ),
            SizedBox(
              width: 16.w,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Men ishlayabman",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(fontWeight: FontWeight.w600, fontSize: 14.sp, fontFamily: "Poppins"),
                  ),
                  Text(
                    maxLines: 2,
                    "Ishlayotgan paytingiz yangi mijozlar haqida haqida xabarnoma olish uchun yoqing",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(fontWeight: FontWeight.w400, fontSize: 12.sp, fontFamily: "Poppins"),
                  ),
                ],
              ),
            ),
            CupertinoSwitch(
                value: con.isNotificationOn,
                onChanged: (bool v) {
                  con.changeNotification(v);
                }),
          ],
        ),
        SizedBox(
          height: 20.h,
        ),
      ],
    );
  }


}
