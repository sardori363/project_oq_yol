import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:go_router/go_router.dart";

import "../../../../../generated/assets.dart";
import "../../../../common/utils/extensions/context_extensions.dart";
import "../../../../common/widget/common used widgets/custom_btn.dart";
import "../../view_model/home_vm.dart";
import "../widgets/filter_page_widgets.dart";

class FilterPage extends ConsumerStatefulWidget {
  const FilterPage({super.key});

  @override
  ConsumerState<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends ConsumerState<FilterPage> {
  @override
  Widget build(BuildContext context) {
    final ColorScheme contextColor = context.theme.colorScheme;
    final HomeVM con = ref.watch(homeVM);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 16, right: 16),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                CustomBtn(iconPath: Assets.iconsKeeyboardLeft, onPressed: () {
                  context.pop();
                }),
                const Spacer(),
                Text(
                  "Filter",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(fontWeight: FontWeight.w500, fontSize: 22.sp, fontFamily: "Poppins"),
                ),
                const Spacer(),
                CustomBtn(iconPath: Assets.iconsRefresh, onPressed: () {}),
              ],
            ),
            SizedBox(
              height: 16.h,
            ),
            Container(
              height: 48.h,
              padding: const EdgeInsets.all(4),
              width: double.infinity,
              decoration: BoxDecoration(color: contextColor.onPrimaryContainer, borderRadius: BorderRadius.circular(20)),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: AnimatedContainer(
                      curve: Curves.linear,
                      duration: const Duration(milliseconds: 600),
                      decoration: BoxDecoration(
                        boxShadow: con.isPassengers
                            ? <BoxShadow>[
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.25),
                                  spreadRadius: 3,
                                  blurRadius: 3,
                                  offset: const Offset(0, 1),
                                ),
                              ]
                            : <BoxShadow>[],
                        borderRadius: BorderRadius.circular(20),
                        color: con.isPassengers ? contextColor.primary : Colors.transparent,
                      ),
                      child: TextButton(
                        onPressed: con.changePassengers,
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        ),
                        child: TweenAnimationBuilder<Color?>(
                          tween: ColorTween(
                            begin: con.isPassengers ? contextColor.primary : contextColor.onPrimary,
                            end: con.isPassengers ? contextColor.onPrimary : contextColor.primary,
                          ),
                          duration: const Duration(milliseconds: 600),
                          curve: Curves.linear,
                          builder: (BuildContext context, Color? color, Widget? child) {
                            return Text(
                              "Yo'lovchilar",
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(color: color, fontWeight: FontWeight.w500, fontSize: 14, fontFamily: "Poppins"),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: AnimatedContainer(
                      curve: Curves.linear,
                      duration: const Duration(milliseconds: 600),
                      decoration: BoxDecoration(
                        boxShadow: !con.isPassengers
                            ? <BoxShadow>[
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.25),
                                  spreadRadius: 3,
                                  blurRadius: 3,
                                  offset: const Offset(0, 1),
                                ),
                              ]
                            : <BoxShadow>[],
                        borderRadius: BorderRadius.circular(20),
                        color: !con.isPassengers ? contextColor.primary : Colors.transparent,
                      ),
                      child: TextButton(
                        onPressed: con.changePassengers,
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        ),
                        child: TweenAnimationBuilder<Color?>(
                          tween: ColorTween(
                            begin: !con.isPassengers ? contextColor.primary : contextColor.onPrimary,
                            end: !con.isPassengers ? contextColor.onPrimary : contextColor.primary,
                          ),
                          duration: const Duration(milliseconds: 600),
                          curve: Curves.linear,
                          builder: (BuildContext context, Color? color, Widget? child) {
                            return Text(
                              "Pochtalar",
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(color: color, fontWeight: FontWeight.w500, fontSize: 14, fontFamily: "Poppins"),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),

            /// settings
            if (con.isPassengers) const PassengerSettings() else const PostageSettings(),
          ],
        ),
      ),
    );
  }
}
