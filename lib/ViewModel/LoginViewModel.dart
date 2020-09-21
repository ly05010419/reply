import 'package:flutter/material.dart';
import 'package:reply/Repository/Repository.dart';
import 'package:reply/models/Models.dart';
import 'package:shared_preferences/shared_preferences.dart';


typedef void LoginSuccessCallback(LoginModel loginModel);
typedef void LoginErrorCallback();

class LoginViewModel extends ChangeNotifier {
  Repository repository = Repository();
  LoginModel loginModel;

  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();


  void login(LoginSuccessCallback success, LoginErrorCallback error) async {
    loginModel = await repository.login(
        emailController.text, passwordController.text);
    if (loginModel != null) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString("email", emailController.text);
      await prefs.setString("password", passwordController.text);
      success(loginModel);
    } else {
      error();
    }
    notifyListeners();
  }

  void signout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    loginModel = null;
    notifyListeners();
  }
}
