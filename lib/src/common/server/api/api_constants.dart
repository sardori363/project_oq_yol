final class ApiConst {

  const ApiConst._();

  static const Duration connectionTimeout = Duration(minutes: 1);
  static const Duration sendTimeout = Duration(minutes: 1);

  static const String baseUrl = "http://185.74.5.104:7090";
  static const String version = "/api/v1";

  // Courses api
  // static const String sendSms = "$version/cabinet/sms/send";
  static const String apiSendCode = "$version/auth/check-phone";
  static const String apiCheckCode = "$version/auth/check-code";
}

final class ApiParams {
  const ApiParams._();


  static Map<String, dynamic> cabinetSmsCheckParams({required String phone, required String code}) => <String, dynamic>{
        "phone": phone,
        "code": code,
      };

  static Map<String, dynamic> emptyParams() => <String, dynamic>{};

}
