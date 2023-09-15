import 'package:get/get.dart';
import 'package:wild_sport/functions/userFunctions.dart';
import 'package:wild_sport/models/userModel.dart';

class UserController extends GetxController {
  var _user = User(id: "", name: "", email: "").obs;

  User get myUser => _user.value;

  void updateUser(User newUser) {
    _user.value = newUser;
  }

  Future<void> signUp(User newUser) async {
    try{
      var response = await registerUser('http://172.20.10.3:3000/api/users', newUser);
      User user = userFromJson(response);
      updateUser(user);
      print("user ready");
    }catch(error) {
      throw Exception(error);
    }
  }

  Future<void> login(User newUser) async {
    try{
      var response = await loginUser('http://172.20.10.3:3000/api/auth', newUser);
      User user = userFromJson(response);
      updateUser(user);
      print("user ready");
    }catch(error) {
      throw Exception(error);
    }
  }

}