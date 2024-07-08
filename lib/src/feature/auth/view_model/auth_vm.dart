import "dart:async";
import "dart:convert";
import "dart:developer";

import "package:flutter/cupertino.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:l/l.dart";

import "../../../common/local/app_storage.dart";
import "../../../common/utils/snackbar.dart";
import "../../../data/entity/registered_model.dart";
import "../../../data/entity/user_login_model.dart";
import "../../../data/repository/app_repository_impl.dart";

AutoDisposeChangeNotifierProvider<AuthVM> authVM =
    ChangeNotifierProvider.autoDispose<AuthVM>(
        (ChangeNotifierProviderRef<AuthVM> ref) => AuthVM());

class AuthVM with ChangeNotifier {
  bool isTapped = false;
  bool isGrey = false;
  bool isRegistered = false;
  TextEditingController numberController = TextEditingController();
  TextEditingController smsCodeController = TextEditingController();
  UserLogin? userLogin;
  // FocusNode phoneNumberFocusNode = FocusNode();
  // FocusNode smsConfirmFocused = FocusNode();

  bool privacyPolicyAccepted = false;
  bool privateDataAccepted = false;
  final Provider<bool> passwordVisibleProvider = Provider<bool>((ProviderRef<bool> ref) => false);

  void switchPrivacy(){
    privacyPolicyAccepted = !privacyPolicyAccepted;
    notifyListeners();
  }

  void switchPrivate(){
    privateDataAccepted = !privateDataAccepted;
    notifyListeners();
  }

  // TODO try to implement this method later, think about logic
  /*
  * // this method will close keyboard automatically, wheb the length of input reaches to the maximum
  // AuthVM() {
  //   numberController.addListener(onPhoneChanged);
  // }
  // Future<void> onPhoneChanged() async {
  //   final String number = getOriginalPhoneNumber(numberController.text);
  //   if (number.length == 9) {
  //     // phoneNumberFocusNode.unfocus();
  //     await Future.delayed(const Duration(milliseconds: 300));
  //     phoneNumberFocusNode.requestFocus();
  //     // SystemChannels.textInput.invokeMethod("TextInput.hide");
  //   }
  //   // phoneNumberFocusNode.addListener(onPhoneChanged);
  // }
  * */

  // void unFocusPhone() {
  //   phoneNumberFocusNode.unfocus();
  // }
  // void unFocusSms() {
  //   smsConfirmFocused.unfocus();
  // }

  void changeColor() {
    isTapped = !isTapped;
    isGrey = true;
    Timer(const Duration(milliseconds: 100), () {
      isGrey = false;
      notifyListeners();
    }).cancel();
    notifyListeners();
  }

  String getOriginalPhoneNumber(String formattedPhoneNumber) {
    return formattedPhoneNumber.replaceAll(RegExp(r"\D"), "");
  }

  Future<void> sendCode(BuildContext context) async {
    final String number = numberController.text.trim();
    log("\n\nNumber: $number\n\n");
    const String code = "UZ";
    userLogin = await AppRepositoryImpl().loginUser(
        number: "+998${getOriginalPhoneNumber(number)}", countryCode: code);
    if (userLogin != null) {
      l.i(isRegistered = userLogin!.success);
      isRegistered = userLogin!.success;
    } else {
      Utils.fireSnackBar("Nimadur xato ketdi", context);
      l.i("${userLogin?.data}");
    }
    notifyListeners();
  }

  Future<void> checkSMSCode(BuildContext context) async {
    isRegistered = false;
    final String code = smsCodeController.text.trim();
    final RegisteredModel? registeredModel = await AppRepositoryImpl()
        .checkCode(
            smsCode: getOriginalPhoneNumber(code),
            smsToken: userLogin?.data.smsCodeId ?? "");
    if (registeredModel != null) {
      await AppStorage.$write(
          key: StorageKey.user, value: jsonEncode(registeredModel.toJson()));
      isRegistered = true;
      notifyListeners();
    } else {
      Utils.fireSnackBar("SMS code xato", context);
    }
    notifyListeners();
  }
}
