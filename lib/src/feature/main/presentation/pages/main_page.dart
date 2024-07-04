import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_svg/svg.dart";

import "../../../../../generated/assets.dart";
import "../../../../common/utils/extensions/context_extensions.dart";
import "../../view_model/main_vm.dart";

class MainPage extends ConsumerWidget {
  const MainPage({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(mainVM);
    final MainVM con = ref.read(mainVM);
    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: con.currentIndex,
        backgroundColor: context.theme.colorScheme.background,
        type: BottomNavigationBarType.fixed,
        onTap: (int index) => con.changeIndex(index, context),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset(Assets.iconsMHome),
            activeIcon: SvgPicture.asset(Assets.iconsMAHome),
            label: context.localized.bottom_nav_bar_main
          ),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(Assets.iconsMFaoliyat),
              activeIcon: SvgPicture.asset(Assets.iconsMAFaoliyat),
              label: context.localized.bottom_nav_bar_career
          ),
          BottomNavigationBarItem(
              icon: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(height: 10),
                  SvgPicture.asset(Assets.iconsMAdd),
                ],
              ),
              activeIcon: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(height: 10),
                  SvgPicture.asset(Assets.iconsMAAdd),
                ],
              ),
              label: ""
          ),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(Assets.iconsMLoyiha),
              activeIcon: SvgPicture.asset(Assets.iconsMALoyihalar),
              label: context.localized.bottom_nav_bar_projects
          ),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(Assets.iconsMProfile),
              activeIcon: SvgPicture.asset(Assets.iconsMAProfile),
              label: context.localized.bottom_nav_bar_profile
          ),
        ],
      ),
    );
  }
}
