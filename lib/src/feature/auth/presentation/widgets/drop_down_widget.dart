import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:flutter_svg/svg.dart";

import "../../../../../generated/assets.dart";
import "../../../../common/utils/extensions/context_extensions.dart";

class DropdownBtn extends StatelessWidget {

  const DropdownBtn({super.key, required this.dropDownListItems, required this.prefixIcon});
  final Widget prefixIcon;
  final List<String> dropDownListItems;

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<String> selectedValue = ValueNotifier<String>(dropDownListItems.first);

    return InputDecorator(
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        contentPadding: EdgeInsets.symmetric(vertical: 2.h),
        filled: true,
        fillColor: context.theme.colorScheme.onPrimaryContainer,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide.none,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(right: 12.w),
        child: ValueListenableBuilder<String>(
          builder: (BuildContext context, String value, Widget? child) {
            return DropdownButton<String>(
              value: value,
              borderRadius: BorderRadius.circular(10),
              isExpanded: true,
              icon: const Icon(CupertinoIcons.chevron_down),
              iconSize: 16.sp,
              elevation: 10,
              style: TextStyle(
                color: context.theme.colorScheme.primary,
              ),
              underline: Container(
                height: 0,
                color: context.theme.colorScheme.primary,
              ),
              onChanged: (String? newValue) {
                selectedValue.value = newValue!;
              },
              items: dropDownListItems.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            );
          },
          valueListenable: selectedValue,
        ),
      ),
    );
  }
}
