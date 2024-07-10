import "package:easy_rich_text/easy_rich_text.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:go_router/go_router.dart";

import "../../../../../generated/assets.dart";
import "../../../../common/routes/app_route_name.dart";
import "../../../../common/utils/extensions/context_extensions.dart";
import "../../../../common/widget/common used widgets/notification_switcher.dart";


class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ColorScheme contextColor = context.theme.colorScheme;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Profil",
          style: Theme
              .of(context)
              .textTheme
              .titleMedium
              ?.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 22.sp, fontFamily: "Poppins"),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 16.w, right: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

              /// header
              Center(
                child: Column(
                  children: [
                    Stack(
                      children: <Widget>[
                        SizedBox(
                          height: 100.h,
                          width: 100.w,
                        ),
                        SvgPicture.asset(Assets.iconsProfile),
                        Positioned(
                          bottom: -8,
                          right: 0,
                          child: TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              padding: const EdgeInsets.all(2),
                              minimumSize: Size(28.w, 28.h),
                              shape: const CircleBorder(),
                              backgroundColor: const Color(0xFF11AD34).withOpacity(0.3),
                            ),
                            child: SvgPicture.asset(Assets.iconsAddPlusCircle, height: 26, width: 26,),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 10.h,),
                    Text(
                      "Sardorbek",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 22.sp, fontFamily: "Poppins"),
                    ),
                    SizedBox(height: 16.h,),
                  ],
                ),
              ),

              /// da line
              Container(
                height: 1,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: contextColor.primaryContainer.withOpacity(0.4),
                ),
              ),
              SizedBox(height: 6.h,),
              Row(
                children: <Widget>[
                  const Spacer(),

                  Column(
                    children: <Widget>[
                      EasyRichText(
                        "20 ta",
                        patternList: [
                          EasyRichTextPattern(
                            targetString: "20",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 18.sp,
                                fontFamily: "Poppins"),
                          ),
                          EasyRichTextPattern(
                            targetString: "ta",
                            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12.sp, fontFamily: "Poppins"),
                          ),
                        ],
                      ),
                      Text(
                        "Yo’lovchiga xizmat qildi",
                        style: Theme
                            .of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(
                            fontWeight: FontWeight.w400,
                            fontSize: 12.sp, fontFamily: "Poppins"),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    children: <Widget>[
                      EasyRichText(
                        "100 kun",
                        patternList: <EasyRichTextPattern>[
                          EasyRichTextPattern(
                            targetString: "100",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 18.sp,
                                fontFamily: "Poppins"),
                          ),
                          EasyRichTextPattern(
                            targetString: "kun",
                            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12.sp, fontFamily: "Poppins"),
                          ),
                        ],
                      ),
                      Text(
                        "Oq Yo’l bilan birga",
                        style: Theme
                            .of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(
                            fontWeight: FontWeight.w400,
                            fontSize: 12.sp, fontFamily: "Poppins"),
                      ),
                    ],
                  ),

                  const Spacer(),
                ],
              ),
              SizedBox(height: 6.h,),

              /// da line
              Container(
                height: 1,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: contextColor.primaryContainer.withOpacity(0.4),
                ),
              ),

              /// header
              SizedBox(height: 12.h,),
              const NotificationSwitcher(),
              SizedBox(height: 16.h,),

              /// general settings
              Text(
                "Umumiy",
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 16.sp, fontFamily: "Poppins"),
              ),
              SizedBox(height: 20.h,),
              MaterialButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                onPressed: (){
                  GoRouter.of(context).go("${AppRouteName.profilePage}/${AppRouteName.settings_profile}");
                },
                child: Row(
                  children: <Widget>[
                    SvgPicture.asset(Assets.iconsRegisterUser),
                    SizedBox(width: 10.w,),
                    Text(
                      "Mening ma’lumotlarim",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp, fontFamily: "Poppins"),
                    ),
                    const Spacer(),
                    SvgPicture.asset(Assets.iconsKeyboardRight),
                  ],
                ),
              ),
              MaterialButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                onPressed: (){
                  GoRouter.of(context).go("${AppRouteName.profilePage}/${AppRouteName.settings_appearance}");
                },
                child: Row(
                  children: <Widget>[
                    SvgPicture.asset(Assets.iconsDisplay),
                    SizedBox(width: 10.w,),
                    Text(
                      "Dastur ko’rinishi",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp, fontFamily: "Poppins"),
                    ),
                    const Spacer(),
                    SvgPicture.asset(Assets.iconsKeyboardRight),
                  ],
                ),
              ),
              MaterialButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                onPressed: (){
                  GoRouter.of(context).go("${AppRouteName.profilePage}/${AppRouteName.settings_car}");
                },
                child: Row(
                  children: <Widget>[
                    SvgPicture.asset(Assets.iconsCar),
                    SizedBox(width: 10.w,),
                    Text(
                      "Mening moshinam",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp, fontFamily: "Poppins"),
                    ),
                    const Spacer(),
                    SvgPicture.asset(Assets.iconsKeyboardRight),
                  ],
                ),
              ),

              /// da line
              SizedBox(height: 10.h,),
              Container(
                height: 1,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: contextColor.primaryContainer.withOpacity(0.4),
                ),
              ),

              /// general settings
              SizedBox(height: 20.h,),
              Text(
                "Yordam",
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 16.sp, fontFamily: "Poppins"),
              ),
              SizedBox(height: 20.h,),
              MaterialButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                onPressed: (){},
                child: Row(
                  children: <Widget>[
                    SvgPicture.asset(Assets.iconsWarning),
                    SizedBox(width: 10.w,),
                    Text(
                      "Shikoyat qilish",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp, fontFamily: "Poppins"),
                    ),
                    const Spacer(),
                    SvgPicture.asset(Assets.iconsKeyboardRight),
                  ],
                ),
              ),
              MaterialButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                onPressed: (){},
                child: Row(
                  children: <Widget>[
                    SvgPicture.asset(Assets.iconsBlackQueston, height: 28,),
                    SizedBox(width: 10.w,),
                    Text(
                      "FAQ",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp, fontFamily: "Poppins"),
                    ),
                    const Spacer(),
                    SvgPicture.asset(Assets.iconsKeyboardRight),
                  ],
                ),
              ),
              MaterialButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                onPressed: (){},
                child: Row(
                  children: <Widget>[
                    SvgPicture.asset(Assets.iconsStop),
                    SizedBox(width: 10.w,),
                    Text(
                      "Xavfsizlik va qoidalar",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp, fontFamily: "Poppins"),
                    ),
                    const Spacer(),
                    SvgPicture.asset(Assets.iconsKeyboardRight),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
