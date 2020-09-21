import 'package:http/http.dart' as http;
import 'package:reply/models/Models.dart';

class Repository {
  Future<LoginModel> login(String email, String password) async {
    var response = await http.post("baseUrl" + "api/token",
        body: {'email': email, 'password': password});
    if (response.statusCode == 200) {
      return LoginModel(name: "ly",email: "ly@gmail.com");
    } else {
      throw new Exception('LoginService status: ${response.statusCode}, body: ${response.body}');
    }
  }
}
