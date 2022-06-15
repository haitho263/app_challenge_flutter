import 'package:app_challenge_flutter/services/networking.dart';

class UserModel {

  Future<dynamic> register(String email, String password) async {
    NetworkHelper networkHelper = NetworkHelper();

    var data = await networkHelper.registerAccount(email, password);
    return data;
  }

  Future<dynamic> login(String email, String password) async {
    NetworkHelper networkHelper = NetworkHelper();

    var data = await networkHelper.login(email, password);
    return data;
  }
}