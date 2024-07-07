import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:go_router/go_router.dart";

import "../../../../../common/routes/app_route_name.dart";
import "../../../../../common/utils/extensions/context_extensions.dart";

class RegisterAuth extends StatelessWidget {
  const RegisterAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Autentifikatsiya",
              style: TextStyle(
                fontSize: 25.sp,
                color: context.theme.colorScheme.primary,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              "Iltimos, elektron pochtangizga yuborgan\nautentifikatsiya kodini kiriting!",
              style: TextStyle(
                fontSize: 16.sp,
                color: context.theme.colorScheme.primaryContainer,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 32.h),
            Form(
              child: Container(
                width: 340.w,
                padding: EdgeInsets.symmetric(vertical: 20.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    SizedBox(
                      width: 62.w,
                      height: 62.h,
                      child: TextField(
                        textInputAction: TextInputAction.next,
                        style: Theme.of(context).textTheme.headlineMedium,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        inputFormatters: <TextInputFormatter>[
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            filled: true,
                            fillColor: context.theme.colorScheme.onPrimary),
                      ),
                    ),
                    SizedBox(
                      width: 62.w,
                      height: 62.h,
                      child: TextField(
                        textInputAction: TextInputAction.next,
                        style: Theme.of(context).textTheme.headlineMedium,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        inputFormatters: <TextInputFormatter>[
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            filled: true,
                            fillColor: context.theme.colorScheme.onPrimary),
                      ),
                    ),
                    SizedBox(
                      width: 62.w,
                      height: 62.h,
                      child: TextField(
                        textInputAction: TextInputAction.next,
                        style: Theme.of(context).textTheme.headlineMedium,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        inputFormatters: <TextInputFormatter>[
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            filled: true,
                            fillColor: context.theme.colorScheme.onPrimary),
                      ),
                    ),
                    SizedBox(
                      width: 62.w,
                      height: 62.h,
                      child: TextField(
                        textInputAction: TextInputAction.done,
                        style: Theme.of(context).textTheme.headlineMedium,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        inputFormatters: <TextInputFormatter>[
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            filled: true,
                            fillColor: context.theme.colorScheme.onPrimary),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 32.h),
            ElevatedButton(
              onPressed: () {
                context.go(AppRouteName.homePage);
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
                  "Jo'natish",
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: context.theme.colorScheme.onPrimary,
                  ),
                ),
              ),
            ),
            SizedBox(height: 32.h),
            Center(
              child: Text(
                "Kodni olmadingizmi?",
                style: TextStyle(
                  fontSize: 16.sp,
                  color: context.theme.colorScheme.primaryContainer,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
