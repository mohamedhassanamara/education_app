import 'package:flutter/material.dart';

class PointsViewModel extends ChangeNotifier {
  late int _points;
  int get getPoints => _points;

  PointsViewModel() {
    _points = 0;
  }

  void addPoints(int value) {
    _points += value;
    notifyListeners();
  }

  void removePoints(int value) {
    _points -= value;
    notifyListeners();
  }

}