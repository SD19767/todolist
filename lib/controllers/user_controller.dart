import 'dart:ffi';
import 'package:get/get.dart';
import '../dataModel/user_model.dart';

class UserController extends GetxController {
  final users = <UserModel>[].obs;

  void createUser(String name, int age) {
    var user = UserModel(name: name, age: age);
    users.add(user);
  }

  void deleteUser(int index) {
    users.removeAt(index);
  }
}