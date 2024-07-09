import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:go_router/go_router.dart";

import "../../../../../../generated/assets.dart";
import "../../../../../common/utils/extensions/context_extensions.dart";

class SettingsAppearance extends StatelessWidget {
  const SettingsAppearance({super.key});

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<int> appearanceChanger = ValueNotifier<int>(1);
    final ValueNotifier<int> fontSizeChanger = ValueNotifier<int>(2);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            context.pop();
          },
          icon: Icon(CupertinoIcons.back, color: context.theme.colorScheme.primary, size: 30.sp,),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Dastur ko'rinishi",
              style: TextStyle(
                fontSize: 30.sp,
                color: context.theme.colorScheme.primary,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              "Quyidagilardan birini tanlab SAQLASH tugmasini bosishingiz dasturning korinishini(ranglarini) sizning xohishingizga ko’ra o’zgartiradi",
              style: TextStyle(
                fontSize: 16.sp,
                color: context.theme.colorScheme.primaryContainer,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 20.h),
            ValueListenableBuilder<int>(
                valueListenable: appearanceChanger,
                builder: (BuildContext context, int value, Widget? child) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Image.asset(
                            Assets.imagesWhite,
                            width: 110.w,
                            height: 215.h,
                          ),
                          Text(
                            "Oq",
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              appearanceChanger.value = 1;
                            },
                            icon: SvgPicture.asset(
                              Assets.iconsCircleIcon,
                              color: value == 1 ? context.theme.colorScheme.primary : null,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Image.asset(
                            Assets.imagesDark,
                            width: 110.w,
                            height: 215.h,
                          ),
                          Text(
                            "Qora",
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              appearanceChanger.value = 2;
                            },
                            icon: SvgPicture.asset(
                              Assets.iconsCircleIcon,
                              color: value == 2 ? context.theme.colorScheme.primary : null,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Image.asset(
                            Assets.imagesSystem,
                            width: 110.w,
                            height: 215.h,
                          ),
                          Text(
                            "Sistema",
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              appearanceChanger.value = 3;
                            },
                            icon: SvgPicture.asset(
                              Assets.iconsCircleIcon,
                              color: value == 3 ? context.theme.colorScheme.primary : null,
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                }),
            SizedBox(height: 40.h),
            Text(
              "Dastur shrift hajmi",
              style: TextStyle(
                fontSize: 22.sp,
                color: context.theme.colorScheme.primary,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 20.h),
            ValueListenableBuilder<int>(
                valueListenable: fontSizeChanger,
                builder: (BuildContext context, int value, Widget? child) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Text(
                            "Kichkina",
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              fontSizeChanger.value = 1;
                            },
                            icon: SvgPicture.asset(
                              Assets.iconsCircleIcon,
                              color: value == 1 ? context.theme.colorScheme.primary : null,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Text(
                            "O'rtacha",
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              fontSizeChanger.value = 2;
                            },
                            icon: SvgPicture.asset(
                              Assets.iconsCircleIcon,
                              color: value == 2 ? context.theme.colorScheme.primary : null,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Text(
                            "Katta",
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              fontSizeChanger.value = 3;
                            },
                            icon: SvgPicture.asset(
                              Assets.iconsCircleIcon,
                              color: value == 3 ? context.theme.colorScheme.primary : null,
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                }),
            SizedBox(height: 60.h),
            ElevatedButton(
              onPressed: () {
                context.pop();
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
                  "Saqlash",
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
