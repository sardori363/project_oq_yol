import "package:easy_rich_text/easy_rich_text.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:flutter_svg/svg.dart";

import "../../../../../generated/assets.dart";
import "../../../../common/utils/extensions/context_extensions.dart";

class HistoryPassengerGenerator extends ConsumerWidget {
  const HistoryPassengerGenerator({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ColorScheme contextColor = context.theme.colorScheme;
    return ListView.builder(
      itemCount: 10,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return Container(
          margin: EdgeInsets.only(left: 4.w, right: 4.w, top: 16.h),
          width: double.infinity,
          decoration: BoxDecoration(
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: contextColor.primaryContainer.withOpacity(0.25),
                  blurRadius: 4,
                ),
              ],
              borderRadius: BorderRadius.circular(8),
              color: contextColor.onPrimary
          ),
          child: Column(
            children: <Widget>[
              /// Name line
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                child: Row(
                  children: <Widget>[
                    Text(
                      "Sardorbek",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(
                          fontWeight: FontWeight.w700,
                          fontSize: 16.sp, fontFamily: "Poppins"),
                    ),
                    const Spacer(),
                    EasyRichText(
                      "Yo’lovchilar soni: 4",
                      patternList: <EasyRichTextPattern>[
                        EasyRichTextPattern(
                          targetString: "Yo’lovechild soni:",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14.sp,
                              color: contextColor.primaryContainer,
                              fontFamily: "Poppins"),
                        ),
                        EasyRichTextPattern(
                          targetString: "4",
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 14.sp, color: contextColor.primary, fontFamily: "Poppins"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h,),
              /// da line
              Container(
                width: double.infinity,
                height: 1,
                color: Color(0xffE3E3E3),
              ),
              SizedBox(height: 20.h,),
              /// location line
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Toshkent sh.",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 24.sp, fontFamily: "Poppins"),
                    ),
                    SvgPicture.asset(Assets.iconsLineArrowRight),
                    Text(
                      "Andijon vil.",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 24.sp, fontFamily: "Poppins"),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.h,),
              /// number line
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Jo’nash vaqti:",
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              color: contextColor.primaryContainer,
                              fontWeight: FontWeight.w700,
                              fontSize: 12.sp,
                              fontFamily: "Poppins"),
                        ),
                        Text(
                          "28-Mart 2024, 14:00",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(fontWeight: FontWeight.w500, fontSize: 12.sp, fontFamily: "Poppins"),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Telefon raqam:",
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              color: contextColor.primaryContainer,
                              fontWeight: FontWeight.w700,
                              fontSize: 12.sp,
                              fontFamily: "Poppins"),
                        ),
                        Text(
                          "+998-91-603-38-30",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(fontWeight: FontWeight.w500, fontSize: 12.sp, fontFamily: "Poppins"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
