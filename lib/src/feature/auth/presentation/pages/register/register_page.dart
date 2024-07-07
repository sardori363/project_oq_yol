import "package:flutter/gestures.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter_multi_formatter/flutter_multi_formatter.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:go_router/go_router.dart";

import "../../../../../../generated/assets.dart";
import "../../../../../common/routes/app_route_name.dart";
import "../../../../../common/styles/app_colors.dart";
import "../../../../../common/utils/extensions/context_extensions.dart";

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<bool> passwordVisible = ValueNotifier(false);
    final ValueNotifier<bool> passwordVisibleConfirm = ValueNotifier(false);
    final ValueNotifier<bool> isValidPhone = ValueNotifier(false);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(height: 100.h),
              Text(
                "Ro’yxatdan o’ting",
                style: TextStyle(
                  fontSize: 25.sp,
                  color: AppColors.black,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                "Iltimos, ro’yxatdan o’tish uchun quyidagi\nma’lumotlarni to’ldiring!",
                style: TextStyle(
                  fontSize: 16.sp,
                  color: context.theme.colorScheme.primaryContainer,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 27.h),

              Text(
                "F.I.Sh",
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.black,
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
                  color: AppColors.black,
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
                "Parolni kiriting",
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.black,
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
                "Parolni takrorlang",
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.black,
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
                    "Keyingi",
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: context.theme.colorScheme.onPrimary,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 100.h),
              Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: "Allaqachon akkount ochganmisiz?  ",
                    style: TextStyle(
                      color: context.theme.colorScheme.primaryContainer,
                      fontWeight: FontWeight.w700,
                    ),
                    children: <InlineSpan>[
                      TextSpan(
                          text: "Login",
                          style: TextStyle(
                            color: context.theme.colorScheme.primary,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              context.go(AppRouteName.login_page);
                            }),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 50.h),
            ],
          ),
        ),
      ),
    );
  }
}
