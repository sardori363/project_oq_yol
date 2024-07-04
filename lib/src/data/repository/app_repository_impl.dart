// ignore_for_file: use_build_context_synchronously, unnecessary_string_interpolations

import "dart:developer";

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "package:l/l.dart";
import "../../common/server/api/api.dart";
import "../../common/server/api/api_constants.dart";
import "../entity/registered_model.dart";
import "../entity/user_login_model.dart";
import 'app_repository.dart';

@immutable
final class AppRepositoryImpl implements AppRepository {

  factory AppRepositoryImpl() => _impl;

  const AppRepositoryImpl._internal();
  static const AppRepositoryImpl _impl = AppRepositoryImpl._internal();

  @override
  Future<String?> example({required String id, required String status}) {
    throw UnimplementedError();
  }

  @override
  Future<UserLogin?> loginUser({required String number, required String countryCode}) async {
    final String? str = await ApiService.post(ApiConst.apiSendCode, {
      "phoneNumber":number,
      "language":countryCode,
    });
    log(str.toString());
    if(str != null){
      l.i("${userLoginFromJson(str)}");
      return userLoginFromJson(str);
    }else{
      l.e("${userLoginFromJson(str.toString())}");
      return null;
    }
  }

  @override
  Future<RegisteredModel?> checkCode({required String smsCode, required String smsToken}) async{
    final String? str = await ApiService.post(ApiConst.apiCheckCode, {
      "code":smsCode,
      "smsCodeId":smsToken,
    });
    if(str != null){
      return registeredModelFromJson(str);
    }else{
      return null;
    }
  }

}
