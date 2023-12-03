import 'package:flutter/material.dart';

// import '../enums/user_enums.dart';

class UserViewModels extends ChangeNotifier {
  late int _points;
  int get getPoints => _points;
  String name = 'Abdslem yajour';
  // Division division = Division.Bronze;


  UserViewModels() {
    _points = 1000;
    // division = Division.Gold;
  }

  void addPoints(int value) {
    _points += value;
    notifyListeners();
  }

  void removePoints(int value) {
    _points -= value;
    notifyListeners();
  }

  // void changeDivision(Division value) {
    // division = value;
    // notifyListeners();
  // }

}