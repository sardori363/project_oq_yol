import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:flutter_svg/svg.dart";

import "../../utils/extensions/context_extensions.dart";

class CustomBtn extends ConsumerWidget {
  const CustomBtn({super.key, required this.iconPath, required this.onPressed});
  final String iconPath;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ColorScheme contextColor = context.theme.colorScheme;
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        minimumSize: Size(40.w, 40.h),
        padding: EdgeInsets.symmetric(horizontal: 8.h, vertical: 8.w),
        side: BorderSide(color: contextColor.primaryContainer),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
      child: SvgPicture.asset(iconPath),
    );
  }
}
