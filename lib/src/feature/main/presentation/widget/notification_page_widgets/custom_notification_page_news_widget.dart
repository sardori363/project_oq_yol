import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";

import "../../../../../common/utils/extensions/context_extensions.dart";

class CustomNotificationPageNewsWidget extends StatelessWidget {
  const CustomNotificationPageNewsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        child: IntrinsicHeight(
          child: Card(
            elevation: 0,
            color: context.theme.colorScheme.secondaryContainer,
            surfaceTintColor: context.theme.colorScheme.secondaryContainer,
            // margin: EdgeInsets.symmetric(vertical: 20.h),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.r)),
            child: Row(
              children: <Widget>[
                Container(
                  // height: constrains.maxHeight,
                  width: 5,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15.r),
                        bottomLeft: Radius.circular(15.r),
                      )),
                ),
                Expanded(
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Bugun 23:24",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(
                                      color: context.theme.colorScheme.primary,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "Poppins",
                                      fontSize: 16.sp),
                            ),
                            Text(
                              "23.04.2024",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(
                                      color:
                                          context.theme.colorScheme.onTertiary,
                                      // fontWeight: FontWeight.w500,
                                      fontFamily: "Poppins",
                                      fontSize: 14.sp,
                              fontWeight: FontWeight.w300
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 15.w),
                          child: Column(
                            children: <Widget>[
                              Text(
                                "PDP Spring TechFest navbatdagi tadbiri mehmoni MyTaxi, Express24 va Workly asoschisi Akmal Paiziev.",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                        color: context.theme.colorScheme
                                            .onSecondaryContainer,
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.w500,
                                        fontSize: 20.sp),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                "Bizning IT maktabimiz binosining tashqi qurilish ishlari muvaffaqiyatli yakunlanmoqda. Tom qoplamasi va devorlar qurildi, endi ichki bezatish ishlari boshlanadi.",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                        color: context.theme.colorScheme
                                            .onSecondaryContainer,
                                        fontWeight: FontWeight.w300,
                                        fontFamily: "Poppins",
                                        fontSize: 18.sp),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
