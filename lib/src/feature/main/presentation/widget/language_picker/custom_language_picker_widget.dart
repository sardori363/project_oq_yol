/*
* This  is Language Picker main widget
* */
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter/widgets.dart";
import "package:go_router/go_router.dart";
import "../../../../../../generated/assets.dart";
import "../../../../../common/routes/app_route_name.dart";
import "../../../../../common/widget/app_material_context.dart";
import "../../../../settings/inherited/local_controller.dart";
import "../../../../settings/model/language_type.dart";
import "custom_each_language_picker_widget.dart";

class CustomLanguagePickerWidget extends StatelessWidget {
  const CustomLanguagePickerWidget(
      {super.key, required this.localControllerVm, required this.shouldGoNext});

  final LocalController localControllerVm;
  final bool shouldGoNext;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        const SizedBox(height: 20),
        CustomEachLanguagePickerWidget(
          context: context,
          onSelect: () {
            Future<dynamic>.delayed(const Duration(seconds: 2)).then<dynamic>(
                (value) => shouldGoNext
                    ? context.go(AppRouteName.homePage)
                    : context.pop());

            localControllerVm.changeLocal(LanguageType.uz);
          },
          language: "O'zbekcha",
          selected: localController.selectedLanguage == "uz",
          countryFlag: Assets.imagesUzbFlag,
        ),
        CustomEachLanguagePickerWidget(
          context: context,
          onSelect: () {
            Future<dynamic>.delayed(const Duration(seconds: 2)).then<dynamic>(
                (value) => shouldGoNext
                    ? context.go(AppRouteName.homePage)
                    : context.pop());

            localControllerVm.changeLocal(LanguageType.ru);
          },
          language: "Русский",
          selected: localController.selectedLanguage == "ru",
          countryFlag: Assets.imagesRusFlag,
        ),
        CustomEachLanguagePickerWidget(
          context: context,
          onSelect: () {
            Future<dynamic>.delayed(const Duration(seconds: 2)).then<dynamic>(
                (value) => shouldGoNext
                    ? context.go(AppRouteName.homePage)
                    : context.pop());

            localControllerVm.changeLocal(LanguageType.en);
          },
          language: "English",
          selected: localController.selectedLanguage == "en",
          countryFlag: Assets.imagesEnFlag,
        ),
      ],
    );
  }
}
