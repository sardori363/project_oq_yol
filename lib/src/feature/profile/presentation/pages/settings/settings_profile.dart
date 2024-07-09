import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter_multi_formatter/formatters/masked_input_formatter.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:flutter_svg/svg.dart";
import "package:go_router/go_router.dart";

import "../../../../../../generated/assets.dart";
import "../../../../../common/routes/app_route_name.dart";
import "../../../../../common/utils/extensions/context_extensions.dart";

class SettingsProfile extends StatelessWidget {
  const SettingsProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<bool> passwordVisible = ValueNotifier(false);
    final ValueNotifier<bool> passwordVisibleConfirm = ValueNotifier(false);
    final ValueNotifier<bool> isValidPhone = ValueNotifier(false);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Mening ma'lumotlarim",
          style: TextStyle(
            fontSize: 25.sp,
            color: context.theme.colorScheme.primary,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Icon(
            CupertinoIcons.back,
            color: context.theme.colorScheme.primary,
            size: 30.sp,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(height: 20.h),
              Text(
                "F.I.Sh",
                style: TextStyle(
                  fontSize: 14.sp,
                  color: context.theme.colorScheme.primary,
                  fontWeight: FontWeight.w500,
                ),
              ),
              TextFormField(
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SvgPicture.asset(Assets.iconsRegisterUser),
                  ),
                  filled: true,
                  fillColor: context.theme.colorScheme.onPrimaryContainer,
                  hintText: "Alisher Pardayev",
                  hintStyle: const TextStyle(fontWeight: FontWeight.w600),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 20.h),

              /// Telefon raqam
              Text(
                "Telefon raqam",
                style: TextStyle(
                  fontSize: 14.sp,
                  color: context.theme.colorScheme.primary,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 10.h),
              ValueListenableBuilder<bool>(
                builder: (BuildContext context, bool value, Widget? child) {
                  return TextFormField(
                    textInputAction: TextInputAction.next,
                    onChanged: (String value) {
                      if (value.length == 14) {
                        isValidPhone.value = true;
                      } else {
                        isValidPhone.value = false;
                      }
                    },
                    inputFormatters: <TextInputFormatter>[
                      MaskedInputFormatter("(##) ###-##-##"),
                    ],
                    keyboardType: TextInputType.number,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 6.w),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(
                              "+998",
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                                color: context.theme.colorScheme.primary,
                              ),
                            ),
                            SvgPicture.asset(Assets.iconsLoginArrowDown),
                          ],
                        ),
                      ),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: SvgPicture.asset(
                          Assets.iconsCheckCircleGrey,
                          color: value ? context.theme.colorScheme.primary : context.theme.colorScheme.onTertiary,
                        ),
                      ),
                      hintText: "(93) 935-03-21",
                      filled: true,
                      fillColor: context.theme.colorScheme.onPrimaryContainer,
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  );
                },
                valueListenable: isValidPhone,
              ),
              SizedBox(height: 20.h),

              /// Parol kiritish
              Text(
                "Hozirgi Parolingiz",
                style: TextStyle(
                  fontSize: 14.sp,
                  color: context.theme.colorScheme.primary,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 10.h),

              ValueListenableBuilder(
                valueListenable: passwordVisible,
                builder: (BuildContext context, bool value, Widget? child) {
                  return TextFormField(
                    obscureText: value,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: context.theme.colorScheme.onPrimaryContainer,
                      hintText: "********",
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide.none,
                      ),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(12),
                        child: SvgPicture.asset(Assets.iconsPasswordKey),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          value ? Icons.visibility : Icons.visibility_off,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        onPressed: () {
                          passwordVisible.value = !value;
                        },
                      ),
                    ),
                    validator: (String? value) {
                      // Password must be at least 8 characters long and include uppercase, lowercase, numbers, and special characters
                      const String pattern = r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W_])[A-Za-z\d\W_]{8,}$";
                      final RegExp regex = RegExp(pattern);
                      if (value == null || value.isEmpty) {
                        return "Password is required";
                      }
                      if (!regex.hasMatch(value)) {
                        return "Password must be at least 8 characters long and include uppercase, lowercase, numbers, and special characters";
                      }
                      return null;
                    },
                  );
                },
              ),

              SizedBox(height: 20.h),

              /// Parol kiritish
              Text(
                "Yangi Parolni kiriting",
                style: TextStyle(
                  fontSize: 14.sp,
                  color: context.theme.colorScheme.primary,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 10.h),

              ValueListenableBuilder(
                valueListenable: passwordVisible,
                builder: (BuildContext context, bool value, Widget? child) {
                  return TextFormField(
                    obscureText: value,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: context.theme.colorScheme.onPrimaryContainer,
                      hintText: "********",
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide.none,
                      ),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(12),
                        child: SvgPicture.asset(Assets.iconsPasswordKey),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          value ? Icons.visibility : Icons.visibility_off,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        onPressed: () {
                          passwordVisible.value = !value;
                        },
                      ),
                    ),
                    validator: (String? value) {
                      // Password must be at least 8 characters long and include uppercase, lowercase, numbers, and special characters
                      const String pattern = r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W_])[A-Za-z\d\W_]{8,}$";
                      final RegExp regex = RegExp(pattern);
                      if (value == null || value.isEmpty) {
                        return "Password is required";
                      }
                      if (!regex.hasMatch(value)) {
                        return "Password must be at least 8 characters long and include uppercase, lowercase, numbers, and special characters";
                      }
                      return null;
                    },
                  );
                },
              ),

              SizedBox(height: 20.h),

              Text(
                "Yangi Parolni takrorlang",
                style: TextStyle(
                  fontSize: 14.sp,
                  color: context.theme.colorScheme.primary,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 10.h),

              ValueListenableBuilder(
                valueListenable: passwordVisibleConfirm,
                builder: (BuildContext context, bool value, Widget? child) {
                  return TextFormField(
                    obscureText: value,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: context.theme.colorScheme.onPrimaryContainer,
                      hintText: "********",
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide.none,
                      ),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(12),
                        child: SvgPicture.asset(Assets.iconsPasswordKey),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          value ? Icons.visibility : Icons.visibility_off,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        onPressed: () {
                          passwordVisibleConfirm.value = !value;
                        },
                      ),
                    ),
                    validator: (String? value) {
                      // Password must be at least 8 characters long and include uppercase, lowercase, numbers, and special characters
                      const String pattern = r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W_])[A-Za-z\d\W_]{8,}$";
                      final RegExp regex = RegExp(pattern);
                      if (value == null || value.isEmpty) {
                        return "Password is required";
                      }
                      if (!regex.hasMatch(value)) {
                        return "Password must be at least 8 characters long and include uppercase, lowercase, numbers, and special characters";
                      }
                      return null;
                    },
                  );
                },
              ),

              SizedBox(height: 60.h),
              ElevatedButton(
                onPressed: () {
                  context.go(AppRouteName.register_auth);
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(context.theme.colorScheme.primary),
                  minimumSize: MaterialStateProperty.all(Size(340.w, 54.h)),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                child: Container(
                  width: 340.w,
                  height: 54.h,
                  alignment: Alignment.center,
                  child: Text(
                    "Saqlash",
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: context.theme.colorScheme.onPrimary,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
