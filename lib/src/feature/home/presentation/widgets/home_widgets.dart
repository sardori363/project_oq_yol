import "package:easy_rich_text/easy_rich_text.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:flutter_svg/svg.dart";
import "package:url_launcher/url_launcher.dart";

import "../../../../../generated/assets.dart";
import "../../../../common/utils/extensions/context_extensions.dart";
import "../../../../common/widget/common used widgets/notification_switcher.dart";

class PassengerGenerator extends ConsumerWidget {
  const PassengerGenerator({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ColorScheme contextColor = context.theme.colorScheme;
    return ListView.builder(
      itemCount: 10,
      padding: const EdgeInsets.only(top: 10),
      physics: const BouncingScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return index != 0
            ? Container(
                width: double.infinity,
                margin: EdgeInsets.only(left: 4.w, right: 4.w, bottom: 10.h),
                decoration: BoxDecoration(
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: contextColor.primaryContainer.withOpacity(0.25),
                      blurRadius: 4,
                    ),
                  ],
                  color: contextColor.onPrimary,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: <Widget>[
                    /// name and plus button
                    Padding(
                      padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
                      child: Row(
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Sardorbek",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(fontWeight: FontWeight.w700, fontSize: 16.sp, fontFamily: "Poppins"),
                              ),
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
                          const Spacer(),
                          TextButton(
                            onPressed: () {
                              showCustomDialog(context);
                            },
                            style: TextButton.styleFrom(minimumSize: Size(26.w, 26.h), shape: const CircleBorder()),
                            child: SvgPicture.asset(Assets.iconsQuestion),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),

                    /// da line
                    Container(
                      width: double.infinity,
                      height: 1,
                      color: contextColor.onSecondaryContainer,
                    ),

                    SizedBox(
                      height: 10.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          // Text(
                          //   "Lokatsiya:",
                          //   style: Theme.of(context)
                          //       .textTheme
                          //       .titleMedium
                          //       ?.copyWith(
                          //       color: contextColor.primaryContainer,
                          //       fontWeight: FontWeight.w700,
                          //       fontSize: 12, fontFamily: "Poppins"),
                          // ),
                          Row(
                            children: <Widget>[
                              Text(
                                "Toshkent sh.",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(fontWeight: FontWeight.w700, fontSize: 18.sp, fontFamily: "Poppins"),
                              ),
                              const Spacer(),
                              SvgPicture.asset(
                                Assets.iconsLineArrowRight,
                                height: 32.h,
                                width: 32.w,
                              ),
                              const Spacer(),
                              Text(
                                "Andijon vil.",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(fontWeight: FontWeight.w700, fontSize: 18.sp, fontFamily: "Poppins"),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          EasyRichText(
                            "So’ralgan avtomobil: Cobalt",
                            patternList: [
                              EasyRichTextPattern(
                                targetString: "So’ralgan avtomobil: ",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12.sp,
                                    color: contextColor.primaryContainer,
                                    fontFamily: "Poppins"),
                              ),
                              EasyRichTextPattern(
                                targetString: "Cobalt",
                                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12.sp, fontFamily: "Poppins"),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Row(
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Jo’nash vaqti:",
                                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                        color: contextColor.primaryContainer,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12.sp,
                                        fontFamily: "Poppins"),
                                  ),
                                  Text(
                                    "28-Mart 2024, Dushanba, 14:00",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(fontWeight: FontWeight.w600, fontSize: 12.sp, fontFamily: "Poppins"),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              TextButton(
                                onPressed: () {
                                  _openTelegram("sardoriyyyyyy");
                                },
                                style: TextButton.styleFrom(minimumSize: Size(26.w, 26.h), shape: const CircleBorder()),
                                child: SvgPicture.asset(Assets.iconsTelegram),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          )
                        ],
                      ),
                    ),

                    /// da line
                    Container(
                      width: double.infinity,
                      height: 1,
                      color: contextColor.onSecondaryContainer,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: MaterialButton(
                            height: 48.h,
                            padding: EdgeInsets.zero,
                            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8))),
                            onPressed: () {
                              _makePhoneCall("+998 91 603 38 30");
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                SvgPicture.asset(Assets.iconsPhone),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Text(
                                  "Telefon",
                                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                      color: contextColor.onSecondary, fontWeight: FontWeight.w700, fontSize: 14.sp, fontFamily: "Poppins"),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: 1,
                          height: 48.h,
                          color: contextColor.onSecondaryContainer,
                        ),
                        Expanded(
                          child: MaterialButton(
                            height: 48.h,
                            padding: EdgeInsets.zero,
                            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomRight: Radius.circular(8))),
                            onPressed: () {
                              _openMap("https://www.google.com/maps/search/?api=1&query=37.7749,-122.4194");
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                SvgPicture.asset(Assets.iconsNavigator2, height: 28.h, width: 28.w),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Text(
                                  "Lokatsiya",
                                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                      color: contextColor.secondaryContainer,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14.sp,
                                      fontFamily: "Poppins"),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            : const NotificationSwitcher();
      },
    );
  }
}

class PostageGenerator extends ConsumerWidget {
  const PostageGenerator({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ColorScheme contextColor = context.theme.colorScheme;
    return ListView.builder(
      padding: EdgeInsets.only(top: 10.h),
      itemCount: 10,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return index != 0
            ? Container(
                width: double.infinity,
                margin: EdgeInsets.only(left: 4.w, right: 4.w, bottom: 10.h),
                decoration: BoxDecoration(
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: contextColor.primaryContainer.withOpacity(0.25),
                      blurRadius: 4,
                    ),
                  ],
                  color: contextColor.onPrimary,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: <Widget>[
                    /// name and plus button
                    Padding(
                      padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
                      child: Row(
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Sardorbek",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(fontWeight: FontWeight.w700, fontSize: 16.sp, fontFamily: "Poppins"),
                              ),
                              EasyRichText(
                                "Pochta: 2ta sumka",
                                patternList: <EasyRichTextPattern>[
                                  EasyRichTextPattern(
                                    targetString: "Pochta:",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14.sp,
                                        color: contextColor.primaryContainer,
                                        fontFamily: "Poppins"),
                                  ),
                                  EasyRichTextPattern(
                                    targetString: " 2ta sumka",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700, fontSize: 14.sp, color: contextColor.primary, fontFamily: "Poppins"),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const Spacer(),
                          TextButton(
                            onPressed: () {
                              showCustomDialog(context);
                            },
                            style: TextButton.styleFrom(minimumSize: Size(26.w, 26.h), shape: const CircleBorder()),
                            child: SvgPicture.asset(Assets.iconsQuestion),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),

                    /// da line
                    Container(
                      width: double.infinity,
                      height: 1,
                      color: contextColor.onSecondaryContainer,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          /// here
                          Row(
                            children: <Widget>[
                              Text(
                                "Toshkent sh.",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(fontWeight: FontWeight.w700, fontSize: 18.sp, fontFamily: "Poppins"),
                              ),
                              const Spacer(),
                              SvgPicture.asset(
                                Assets.iconsLineArrowRight,
                                height: 32.h,
                                width: 32.w,
                              ),
                              const Spacer(),
                              Text(
                                "Andijon vil.",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(fontWeight: FontWeight.w700, fontSize: 18.sp, fontFamily: "Poppins"),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Row(
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Jo’nash vaqti:",
                                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                        color: contextColor.primaryContainer,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12.sp,
                                        fontFamily: "Poppins"),
                                  ),
                                  Text(
                                    "28-Mart 2024, Dushanba, 14:00",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(fontWeight: FontWeight.w600, fontSize: 12.sp, fontFamily: "Poppins"),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              TextButton(
                                onPressed: () {
                                  _openTelegram("sardoriyyyyyy");
                                },
                                style: TextButton.styleFrom(minimumSize: Size(26.w, 26.h), shape: const CircleBorder()),
                                child: SvgPicture.asset(Assets.iconsTelegram),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          )
                        ],
                      ),
                    ),

                    /// da line
                    Container(
                      width: double.infinity,
                      height: 1,
                      color: contextColor.onSecondaryContainer,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: MaterialButton(
                            height: 48.h,
                            padding: EdgeInsets.zero,
                            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8))),
                            onPressed: () {
                              _makePhoneCall("+998 91 603 38 30");
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                SvgPicture.asset(Assets.iconsPhone),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Text(
                                  "Telefon",
                                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                      color: contextColor.onSecondary, fontWeight: FontWeight.w700, fontSize: 14.sp, fontFamily: "Poppins"),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: 1,
                          height: 48.h,
                          color: contextColor.onSecondaryContainer,
                        ),
                        Expanded(
                          child: MaterialButton(
                            height: 48.h,
                            padding: EdgeInsets.zero,
                            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomRight: Radius.circular(8))),
                            onPressed: () {
                              _openMap("https://www.google.com/maps/search/?api=1&query=37.7749,-122.4194");
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                SvgPicture.asset(Assets.iconsNavigator2, height: 28.h, width: 28.w),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Text(
                                  "Lokatsiya",
                                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                      color: contextColor.secondaryContainer,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14.sp,
                                      fontFamily: "Poppins"),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            : const NotificationSwitcher();
      },
    );
  }
}

/// funcs
void showCustomDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Text(
                    'Diqqat!',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text('Mijozni tasdiqlashdan naval u bilan aloqaga chiqing'),
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: TextButton(
                      child: const Text('OK'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
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

Future<void> _openMap(String googleMapsUrl) async {
  // const String googleMapsUrl = "https://www.google.com/maps/search/?api=1&query=37.7749,-122.4194";
  // const String yandexMapsUrl = "yandexnavi://maps.yandex.ru/?pt=37.7749,122.4194&z=12";
  await launch(googleMapsUrl);
}

Future<void> _openTelegram(String username) async {
  final String telegramUrl = "https://t.me/$username";
  await launch(telegramUrl);
}

Future<void> _makePhoneCall(String phoneNumber) async {
  final Uri launchUri = Uri(
    scheme: 'tel',
    path: phoneNumber,
  );
  await launch(launchUri.toString());
}
