import "package:easy_rich_text/easy_rich_text.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:flutter_svg/flutter_svg.dart";

import "../../../../../generated/assets.dart";
import "../../../../common/utils/extensions/context_extensions.dart";
import "../../view_model/home_vm.dart";

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ColorScheme contextColor = context.theme.colorScheme;
    final HomeVM con = ref.watch(homeVM);
    return Scaffold(
      body: Padding(
        // padding: EdgeInsets.symmetric(horizontal: 22.w),
        padding: EdgeInsets.only(left: 22.w, right: 22.w, top: 30),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  width: 300.w,
                  height: 40,
                  // padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      // borderRadius: BorderRadius.circular(15),
                      // border: Border.all(color: contextColor.primaryContainer)
                      ),
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      prefixIcon: SizedBox(
                          height: 24,
                          width: 24,
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
                      hintStyle:
                          TextStyle(color: contextColor.primaryContainer, fontSize: 14, fontWeight: FontWeight.w400, fontFamily: "Poppins"),
                    ),
                  ),
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    minimumSize: const Size(40, 40),
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
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
                    minimumSize: const Size(120, 40),
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    side: BorderSide(color: contextColor.primaryContainer),
                    backgroundColor: con.isPassengers ? contextColor.primary : contextColor.onPrimary,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  ),
                  child: Text(
                    "Yo'lovchilar",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: con.isPassengers ? contextColor.onPrimary : contextColor.primary,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
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
                    minimumSize: const Size(120, 40),
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    side: BorderSide(color: contextColor.primaryContainer),
                    backgroundColor: con.isPassengers ? contextColor.onPrimary : contextColor.primary,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  ),
                  child: Text(
                    "Pochtalar",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: con.isPassengers ? contextColor.primary : contextColor.onPrimary,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        fontFamily: "Poppins"),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30.h,
            ),

            /// ads
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(left: 4, right: 4, bottom: 10),
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
                                        ?.copyWith(fontWeight: FontWeight.w700, fontSize: 16, fontFamily: "Poppins"),
                                  ),
                                  EasyRichText(
                                    "Yo’lovchilar soni: 4",
                                    patternList: [
                                      EasyRichTextPattern(
                                        targetString: 'Yo’lovchilar soni:',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400, fontSize: 14, color: contextColor.primaryContainer, fontFamily: "Poppins"),
                                      ),
                                      EasyRichTextPattern(
                                        targetString: '4',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700, fontSize: 14, color: contextColor.primary, fontFamily: "Poppins"),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const Spacer(),
                              TextButton(
                                onPressed: () {},
                                style: TextButton.styleFrom(minimumSize: const Size(26, 26), shape: const CircleBorder()),
                                child: SvgPicture.asset(Assets.iconsQuestion),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 12.h,),
                        /// da line
                        Container(
                          width: double.infinity,
                          height: 1,
                          color: contextColor.onSecondaryContainer,
                        ),

                        SizedBox(height: 10.h,),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              EasyRichText(
                                "So’ralgan avtomobil: Cobalt",
                                patternList: [
                                  EasyRichTextPattern(
                                    targetString: 'So’ralgan avtomobil: ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500, fontSize: 16, color: contextColor.primaryContainer, fontFamily: "Poppins"),
                                  ),
                                  EasyRichTextPattern(
                                    targetString: 'Cobalt',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700, fontSize: 16, color: contextColor.primary, fontFamily: "Poppins"),
                                  ),
                                ],
                              ),
                              SizedBox(height: 5.h,),
                              Text(
                                "Lokatsiya:",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(
                                    color: contextColor.primaryContainer,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 12, fontFamily: "Poppins"),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Toshkent sh.",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12, fontFamily: "Poppins"),
                                  ),
                                  SvgPicture.asset(Assets.iconsLineArrowRight),
                                  Text(
                                    "Andijon vil.",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12, fontFamily: "Poppins"),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10.h,),
                              Text(
                                "Jo’nash vaqti:",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(
                                    color: contextColor.primaryContainer,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 12, fontFamily: "Poppins"),
                              ),
                              Text(
                                "28-Mart 2024, Dushanba, 14:00",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12, fontFamily: "Poppins"),
                              ),
                              SizedBox(height: 10.h,)
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
                                height: 48,
                                padding: EdgeInsets.zero,
                                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8))),
                                onPressed: (){},
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    SvgPicture.asset(Assets.iconsPhone),
                                    SizedBox(width: 5.w,),
                                    Text(
                                      "Telefon",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium
                                          ?.copyWith(
                                          color: contextColor.onSecondary,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 14, fontFamily: "Poppins"),
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
                                height: 48,
                                padding: EdgeInsets.zero,
                                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomRight: Radius.circular(8))),
                                onPressed: (){},
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    SvgPicture.asset(Assets.iconsTelegram),
                                    SizedBox(width: 5.w,),
                                    Text(
                                      "Telegram",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium
                                          ?.copyWith(
                                          color: contextColor.secondary,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 14, fontFamily: "Poppins"),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
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
