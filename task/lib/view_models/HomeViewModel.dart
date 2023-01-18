import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:task/models/HomeModel.dart';

class HomeViewModel with ChangeNotifier {
  List<dynamic> doctors = [];

  bool isLoading = false;
  void _toggleLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  Future getDoctorsInfo() async {
    try {
      _toggleLoading();
      final response = await HomeModel.getDoctorsInfo()
          .timeout(const Duration(seconds: 5), onTimeout: () {
        print("faild");
        _toggleLoading();
      });

      doctors = json.decode(response.body);
      print(doctors);
      _toggleLoading();
    } catch (err) {
      print(err);
    }
  }

  Future lunchEmail(String email) async {
    try{
      await HomeModel.lunchEmail(email);
    }catch(err){
      print(err);
    }
  }

  Future lunchPhone(String phone) async {
   try{
    await HomeModel.lunchPhone(phone);
   }catch(err){
    print(err);
   }
  }

  Future lunchMap(double lat, double long) async {
    try{
      await HomeModel.lunchMap(lat, long);
    }catch(err){
      print(err);
    }
  }
}
