import "package:easy_rich_text/easy_rich_text.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter_multi_formatter/formatters/masked_input_formatter.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:flutter_svg/flutter_svg.dart";

import "../../../../../generated/assets.dart";
import "../../../../common/utils/extensions/context_extensions.dart";
import "../../../../common/widget/common used widgets/notification_switcher.dart";
import "../../../auth/presentation/widgets/drop_down_widget.dart";


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
              SizedBox(height: 12.h,),

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
            ],
          ),
        ),
      ),
    );
  }

}
