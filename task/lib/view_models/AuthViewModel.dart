import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import 'package:task/models/AuthModel.dart';

class AuthViewModel with ChangeNotifier {
  bool isUserAuth = false;
  Map<String,String> userData = {
    "name":"",
  };
  Future isAuth() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (preferences.getString("isAuth") == "yes") {
      isUserAuth = true;
      userData['name'] = preferences.getString("name")!;
    }
  }

  Future login(String email, String password) async {
    try {
      final Map? result = await AuthModel.tryToLogin(email, password);
      if (result != null) {
        SharedPreferences preferences = await SharedPreferences.getInstance();
        preferences.setString("isAuth", "yes");
        preferences.setString("name", result['name']);
        preferences.setString("phone", result['phone_number'].toString());
        preferences.setString("email", result['email']);
        isUserAuth = true;
        notifyListeners();
      }
    } catch (err) {
      print(err);
    }
  }

  Future logout() async {
    print("logout");
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("isAuth", "no");
    isUserAuth = false;
  }
}
