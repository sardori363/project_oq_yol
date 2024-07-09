import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:go_router/go_router.dart";

import "../../../../../generated/assets.dart";
import "../../../../common/routes/app_route_name.dart";
import "../../../../common/utils/extensions/context_extensions.dart";
import "../../../../common/widget/common used widgets/custom_btn.dart";
import "../../view_model/home_vm.dart";
import "../widgets/home_widgets.dart";

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ColorScheme contextColor = context.theme.colorScheme;
    final HomeVM con = ref.watch(homeVM);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 50.h),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                SizedBox(
                  width: 330.w,
                  height: 40.h,
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 15), // Padding inside the TextField
                      prefixIcon: SizedBox(
                        height: 18.h,
                        width: 18.h,
                        child: SvgPicture.asset(
                          Assets.iconsSearchZoomIn,
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: contextColor.primaryContainer),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      hintText: "Qidirish...",
                      hintFadeDuration: const Duration(milliseconds: 300),
                      hintStyle: TextStyle(
                        color: contextColor.primaryContainer,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Poppins",
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                CustomBtn(iconPath: Assets.iconsFilter, onPressed: (){
                  GoRouter.of(context).go("/${AppRouteName.homePage}/${AppRouteName.filterPage}");
                }),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: <Widget>[
                TextButton(
                  onPressed: () {
                    con.changePassengers();
                  },
                  style: TextButton.styleFrom(
                    minimumSize: Size(120.w, 40.h),
                    padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                    side: BorderSide(color: contextColor.primaryContainer),
                    backgroundColor: con.isPassengers ? contextColor.primary : contextColor.onPrimary,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  ),
                  child: Text(
                    "Yo'lovchilar",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: con.isPassengers ? contextColor.onPrimary : contextColor.primary,
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                        fontFamily: "Poppins"),
                  ),
                ),
                SizedBox(
                  width: 12.w,
                ),
                TextButton(
                  onPressed: () {
                    con.changePassengers();
                  },
                  style: TextButton.styleFrom(
                    minimumSize: Size(120.w, 40.h),
                    padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                    side: BorderSide(color: contextColor.primaryContainer),
                    backgroundColor: con.isPassengers ? contextColor.onPrimary : contextColor.primary,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  ),
                  child: Text(
                    "Pochtalar",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: con.isPassengers ? contextColor.primary : contextColor.onPrimary,
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                        fontFamily: "Poppins"),
                  ),
                ),
              ],
            ),
            /// ads
            Expanded(
              child: con.isPassengers ? const PassengerGenerator() : const PostageGenerator(),
            )
          ],
        ),
      ),
    );
  }
}
