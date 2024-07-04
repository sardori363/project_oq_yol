import "dart:convert";

RegisteredModel registeredModelFromJson(String str) => RegisteredModel.fromJson(json.decode(str) as Map<String, dynamic>);

String registeredModelToJson(RegisteredModel data) => json.encode(data.toJson());

class RegisteredModel {

  RegisteredModel({
    required this.success,
    required this.data,
  });

  factory RegisteredModel.fromJson(Map<String, dynamic> json) => RegisteredModel(
    success: json["success"] as bool,
    data: Data.fromJson(json["data"] as Map<String, dynamic>),
  );
  final bool success;
  final Data data;

  RegisteredModel copyWith({
    bool? success,
    Data? data,
  }) =>
      RegisteredModel(
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
    required this.accessToken,
    required this.refreshToken,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    accessToken: json["accessToken"] as String,
    refreshToken: json["refreshToken"] as String,
  );
  final String accessToken;
  final String refreshToken;

  Data copyWith({
    String? accessToken,
    String? refreshToken,
  }) =>
      Data(
        accessToken: accessToken ?? this.accessToken,
        refreshToken: refreshToken ?? this.refreshToken,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
    "accessToken": accessToken,
    "refreshToken": refreshToken,
  };
}
