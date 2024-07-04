import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:flutter_svg/svg.dart";

import "../../../../common/utils/extensions/context_extensions.dart";

class SupportPageEachCardWidget extends StatelessWidget {
  const SupportPageEachCardWidget({super.key, required this.icon, required this.text, required this.function});

  final String icon;
  final String text;
  final VoidCallback function;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      padding: EdgeInsets.zero,
      onPressed: function,
      child: Padding(
        padding: EdgeInsets.only(left: 8.w),
        child: ListTile(
          leading: SvgPicture.asset(
            icon,
            width: 33.w,
          ),
          title: Text(text, style: Theme.of(context).textTheme.titleSmall),
          trailing: Icon(
            Icons.navigate_next_outlined,
            color: context.theme.colorScheme.onTertiary,
          ),
        ),
      ),
    );
  }
}
