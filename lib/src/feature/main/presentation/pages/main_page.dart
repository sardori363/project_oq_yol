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
            icon: SvgPicture.asset(Assets.iconsHome),
            activeIcon: SvgPicture.asset(Assets.iconsActiveHome),
            label: context.localized.bottom_nav_bar_main
          ),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(Assets.iconsCalendar),
              activeIcon: SvgPicture.asset(Assets.iconsActiveCalendar),
              label: context.localized.bottom_nav_bar_schedule
          ),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(Assets.iconsTrash),
              activeIcon: SvgPicture.asset(Assets.iconsActiveTrash),
              label: context.localized.bottom_nav_bar_history
          ),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(Assets.iconsUser),
              activeIcon: SvgPicture.asset(Assets.iconsActiveUser),
              label: context.localized.bottom_nav_bar_profile
          ),
        ],
      ),
    );
  }
}
