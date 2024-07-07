import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:flutter_svg/flutter_svg.dart";

import "../../../../../generated/assets.dart";
import "../../../../common/widget/app_material_context.dart";
import "../../../main/presentation/widget/language_picker/custom_language_picker_widget.dart";

class SplashOne extends StatelessWidget {
  const SplashOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff3f3f3),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Image.asset(Assets.imagesLogonew),
          ),
          Text(
            "Sizga qaysi til qulay?",
            style: TextStyle(fontSize: 28.sp),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50.0),
            child: CustomLanguagePickerWidget(
              shouldGoNext: true,
              localControllerVm: localController,
            ),
          ),
        ],
      ),
    );
  }
}
