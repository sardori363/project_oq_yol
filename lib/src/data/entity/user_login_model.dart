import "dart:convert";

UserLogin userLoginFromJson(String str) => UserLogin.fromJson(json.decode(str) as Map<String, dynamic>);

String userLoginToJson(UserLogin data) => json.encode(data.toJson());

class UserLogin {

  UserLogin({
    required this.success,
    required this.data,
  });

  factory UserLogin.fromJson(Map<String, dynamic> json) => UserLogin(
    success: json["success"] as bool,
    data: Data.fromJson(json["data"] as Map<String, dynamic>),
  );
  final bool success;
  final Data data;

  UserLogin copyWith({
    bool? success,
    Data? data,
  }) =>
      UserLogin(
        success: success ?? this.success,
        data: data ?? this.data,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
    "success": success,
    "data": data.toJson(),
  };
}

class Data {

  Data({
    required this.status,
    required this.smsCodeId,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    status: json["status"] as String,
    smsCodeId: json["smsCodeId"] as String,
  );
  final String status;
  final String smsCodeId;

  Data copyWith({
    String? status,
    String? smsCodeId,
  }) =>
      Data(
        status: status ?? this.status,
        smsCodeId: smsCodeId ?? this.smsCodeId,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
    "status": status,
    "smsCodeId": smsCodeId,
  };
}
