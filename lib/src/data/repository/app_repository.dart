import "../entity/registered_model.dart";
import "../entity/user_login_model.dart";

abstract class AppRepository {
  Future<String?> example({required String id, required String status});

  Future<UserLogin?>loginUser({required String number, required String countryCode});

  Future<RegisteredModel?>checkCode({required String smsCode, required String smsToken});

}
