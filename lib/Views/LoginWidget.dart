import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reply/ViewModel/LoginViewModel.dart';

class LoginWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LoginViewModel loginViewModel = Provider.of<LoginViewModel>(context);

    loginViewModel.emailController.text = "ly05010419@gmail.com";
    loginViewModel.passwordController.text = "123456";

    return Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
                accountName: Text(loginViewModel.loginModel!=null?loginViewModel.loginModel.name:""),
                accountEmail: Text(loginViewModel.loginModel!=null?loginViewModel.loginModel.email:""),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Text(loginViewModel.loginModel!=null?loginViewModel.loginModel.name:""),
                )),
            loginViewModel.loginModel != null
                ? Container()
                : Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                  controller: loginViewModel.emailController,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10.0),
                    labelText: "Username : ",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    ),
                  )),
            ),
            loginViewModel.loginModel != null
                ? Container()
                : Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                  controller: loginViewModel.passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10.0),
                    labelText: "Password : ",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    ),
                  )),
            ),
            loginViewModel.loginModel != null
                ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(
                height: 48,
                color: Colors.blue,
                child: new Text("Signout",
                    style:
                    new TextStyle(fontSize: 16.0, color: Colors.white)),
                onPressed: () {
                  loginViewModel.signout();
                },
              ),
            )
                : Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(
                height: 48,
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: new Text("Login",
                    style:
                    new TextStyle(fontSize: 16.0, color: Colors.white)),
                onPressed: () {
                  loginViewModel.login((loginModel) {
                    Navigator.of(context).pop();
                  }, () {
                    print("Login failed!!!");
                  });
                },
              ),
            )
          ],
        ));
  }
}
