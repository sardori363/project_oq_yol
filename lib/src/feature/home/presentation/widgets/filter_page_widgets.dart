import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:flutter_svg/svg.dart";

import "../../../../../generated/assets.dart";
import "../../../../common/utils/extensions/context_extensions.dart";

class FilterDropDown extends StatelessWidget {

  const FilterDropDown({super.key, required this.dropDownListItems});
  final List<String> dropDownListItems;

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<String> selectedValue = ValueNotifier<String>(dropDownListItems.first);

    return InputDecorator(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 2.h),
        filled: true,
        fillColor: context.theme.colorScheme.onPrimary,
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
              icon: SvgPicture.asset(Assets.iconsKeyboardDown),
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

class PassengerSettings extends StatelessWidget {
  const PassengerSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// time
        Row(
          children: <Widget>[
            SvgPicture.asset(Assets.iconsClock, height: 24, width: 24),
            SizedBox(
              width: 12.w,
            ),
            Text(
              "Vaqt",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontWeight: FontWeight.w600, fontSize: 14.sp, fontFamily: "Poppins"),
            ),
            const Spacer(),
            const SizedBox(
              width: 120,
              height: 40,
              child: FilterDropDown(
                dropDownListItems: ["Ohirgi 2 soat", "Ohirgi 4 soat", "Eng eskilari", "Eng yangilari"],
              ),
            ),
          ],
        ),
        /// AC
        Row(
          children: <Widget>[
            SvgPicture.asset(Assets.iconsAc, height: 24, width: 24),
            SizedBox(
              width: 12.w,
            ),
            Text(
              "Konditsioner",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontWeight: FontWeight.w600, fontSize: 14.sp, fontFamily: "Poppins"),
            ),
            const Spacer(),
            const SizedBox(
              width: 120,
              height: 40,
              child: FilterDropDown(
                dropDownListItems: <String>["Bor", "Yo'q"],
              ),
            ),
          ],
        ),
        /// Gender
        Row(
          children: <Widget>[
            SvgPicture.asset(Assets.iconsFilterUser, height: 24, width: 24),
            SizedBox(
              width: 12.w,
            ),
            Text(
              "Jins",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontWeight: FontWeight.w600, fontSize: 14.sp, fontFamily: "Poppins"),
            ),
            const Spacer(),
            const SizedBox(
              width: 120,
              height: 40,
              child: FilterDropDown(
                dropDownListItems: <String>["Erkak", "Ayol"],
              ),
            ),
          ],
        ),
        /// Initial location
        Row(
          children: <Widget>[
            SvgPicture.asset(Assets.iconsLocationUser, height: 24, width: 24),
            SizedBox(
              width: 12.w,
            ),
            Text(
              "Jo'nash lokatsiyasi",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontWeight: FontWeight.w600, fontSize: 14.sp, fontFamily: "Poppins"),
            ),
            const Spacer(),
            const SizedBox(
              width: 120,
              height: 40,
              child: FilterDropDown(
                dropDownListItems: <String>["Toshkent", "Andijon", "Buxoro", "Farg'ona", "Namangan", "Jizzax", "Buxoro"],
              ),
            ),
          ],
        ),
        /// Final location
        Row(
          children: <Widget>[
            SvgPicture.asset(Assets.iconsLocationDestionation, height: 24, width: 24),
            SizedBox(
              width: 12.w,
            ),
            Text(
              "Yetqazish lokatsiyasi",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontWeight: FontWeight.w600, fontSize: 14.sp, fontFamily: "Poppins"),
            ),
            const Spacer(),
            const SizedBox(
              width: 120,
              height: 40,
              child: FilterDropDown(
                dropDownListItems: <String>["Toshkent", "Andijon", "Buxoro", "Farg'ona", "Namangan", "Jizzax", "Buxoro"],
              ),
            ),
          ],
        )
      ],
    );
  }
}

class PostageSettings extends StatelessWidget {
  const PostageSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// time
        Row(
          children: <Widget>[
            SvgPicture.asset(Assets.iconsClock, height: 24, width: 24),
            SizedBox(
              width: 12.w,
            ),
            Text(
              "Vaqt",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontWeight: FontWeight.w600, fontSize: 14.sp, fontFamily: "Poppins"),
            ),
            const Spacer(),
            const SizedBox(
              width: 120,
              height: 40,
              child: FilterDropDown(
                dropDownListItems: ["Ohirgi 2 soat", "Ohirgi 4 soat", "Eng eskilari", "Eng yangilari"],
              ),
            ),
          ],
        ),
        /// Initial location
        Row(
          children: <Widget>[
            SvgPicture.asset(Assets.iconsLocationUser, height: 24, width: 24),
            SizedBox(
              width: 12.w,
            ),
            Text(
              "Jo'nash lokatsiyasi",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontWeight: FontWeight.w600, fontSize: 14.sp, fontFamily: "Poppins"),
            ),
            const Spacer(),
            const SizedBox(
              width: 120,
              height: 40,
              child: FilterDropDown(
                dropDownListItems: <String>["Toshkent", "Andijon", "Buxoro", "Farg'ona", "Namangan", "Jizzax", "Buxoro"],
              ),
            ),
          ],
        ),
        /// Final location
        Row(
          children: <Widget>[
            SvgPicture.asset(Assets.iconsLocationDestionation, height: 24, width: 24),
            SizedBox(
              width: 12.w,
            ),
            Text(
              "Yetqazish lokatsiyasi",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontWeight: FontWeight.w600, fontSize: 14.sp, fontFamily: "Poppins"),
            ),
            const Spacer(),
            const SizedBox(
              width: 120,
              height: 40,
              child: FilterDropDown(
                dropDownListItems: <String>["Toshkent", "Andijon", "Buxoro", "Farg'ona", "Namangan", "Jizzax", "Buxoro"],
              ),
            ),
          ],
        )
      ],
    );
  }
}