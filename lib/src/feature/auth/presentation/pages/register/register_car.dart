import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter_multi_formatter/formatters/masked_input_formatter.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:flutter_svg/svg.dart";
import "package:go_router/go_router.dart";

import "../../../../../../generated/assets.dart";
import "../../../../../common/routes/app_route_name.dart";
import "../../../../../common/utils/extensions/context_extensions.dart";
import "../../widgets/drop_down_widget.dart";

class RegisterCar extends StatelessWidget {
  const RegisterCar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 160.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              "Ro’yxatdan o’ting",
              style: TextStyle(
                fontSize: 25.sp,
                color: context.theme.colorScheme.primary,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              "Iltimos, ro’yxatdan o’tish uchun mashinagiz\nma’lumotlarini kiriting!",
              style: TextStyle(
                fontSize: 16.sp,
                color: context.theme.colorScheme.primaryContainer,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 27.h),

            /// Moshina
            Text(
              "Moshinani tanlang",
              style: TextStyle(
                fontSize: 14.sp,
                color: context.theme.colorScheme.primary,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 10.h),
            DropdownBtn(
              dropDownListItems: const <String>["Cobolt", "Spark", "Nexia 3", "Gentra", "Boshqa"],
              prefixIcon: Padding(
                padding: const EdgeInsets.all(12.0),
                child: SvgPicture.asset(Assets.iconsCar),
              ),
            ),
            SizedBox(height: 20.h),

            /// Moshina raqami
            Text(
              "Moshina raqamini kiriting",
              style: TextStyle(
                fontSize: 14.sp,
                color: context.theme.colorScheme.primary,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 10.h),
            TextFormField(
              textInputAction: TextInputAction.done,
              inputFormatters: <TextInputFormatter>[
                MaskedInputFormatter("## # ### ##"),
              ],
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 2.h),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SvgPicture.asset(Assets.iconsUzIcon),
                ),
                filled: true,
                fillColor: context.theme.colorScheme.onPrimaryContainer,
                hintText: "01 A 123 NN",
                hintStyle: const TextStyle(fontWeight: FontWeight.w600),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 20.h),

            /// Moshina ragi
            Text(
              "Konditsioner",
              style: TextStyle(
                fontSize: 14.sp,
                color: context.theme.colorScheme.primary,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 10.h),
            DropdownBtn(
              dropDownListItems: const <String>["Qora", "Oq", "Havorang", "Sariq", "Ko'k", "Boshqa"],
              prefixIcon: Padding(
                padding: const EdgeInsets.all(12.0),
                child: SvgPicture.asset(Assets.iconsBlack),
              ),
            ),
            SizedBox(height: 20.h),

            /// Konditsioner
            Text(
              "Konditsioner",
              style: TextStyle(
                fontSize: 14.sp,
                color: context.theme.colorScheme.primary,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 10.h),
            DropdownBtn(
              dropDownListItems: const <String>["Bor", "Yo'q"],
              prefixIcon: Padding(
                padding: const EdgeInsets.all(12.0),
                child: SvgPicture.asset(Assets.iconsAirConditioner),
              ),
            ),
            SizedBox(height: 60.h),
            ElevatedButton(
              onPressed: () {
                context.go(AppRouteName.homePage);
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(context.theme.colorScheme.primary),
                minimumSize: MaterialStateProperty.all(Size(340.w, 54.h)),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              child: Container(
                width: 340.w,
                height: 54.h,
                alignment: Alignment.center,
                child: Text(
                  "Tayyor",
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: context.theme.colorScheme.onPrimary,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
