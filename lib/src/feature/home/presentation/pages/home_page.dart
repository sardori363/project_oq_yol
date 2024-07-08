import "package:easy_rich_text/easy_rich_text.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:url_launcher/url_launcher.dart";

import "../../../../../generated/assets.dart";
import "../../../../common/utils/extensions/context_extensions.dart";
import "../../view_model/home_vm.dart";

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

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
                    const Text('Mijozni tasdiqlashdan avval u bilan aloqaga chiqing'),
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

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ColorScheme contextColor = context.theme.colorScheme;
    final HomeVM con = ref.watch(homeVM);
    return Scaffold(
      body: Padding(
        // padding: EdgeInsets.symmetric(horizontal: 22.w),
        padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 50.h),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  width: 300.w,
                  height: 40.h,
                  // padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      // borderRadius: BorderRadius.circular(15),
                      // border: Border.all(color: contextColor.primaryContainer)
                      ),
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(10),
                      prefixIcon: SizedBox(
                          height: 24.h,
                          width: 24.h,
                          child: SvgPicture.asset(
                            Assets.iconsSearchZoomIn,
                            fit: BoxFit.scaleDown,
                          )),
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
                          color: contextColor.primaryContainer, fontSize: 14.sp, fontWeight: FontWeight.w400, fontFamily: "Poppins"),
                    ),
                  ),
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    minimumSize: Size(40.w, 40.h),
                    padding: EdgeInsets.symmetric(horizontal: 8.h, vertical: 8.w),
                    side: BorderSide(color: contextColor.primaryContainer),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  ),
                  child: SvgPicture.asset(Assets.iconsFilter),
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
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
              child: ListView.builder(
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
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 14.sp,
                                                  color: contextColor.primary,
                                                  fontFamily: "Poppins"),
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
                                                color: contextColor.onSecondary,
                                                fontWeight: FontWeight.w700,
                                                fontSize: 14.sp,
                                                fontFamily: "Poppins"),
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
                      : Column(
                          children: [
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
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
