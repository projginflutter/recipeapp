import 'package:flutter/material.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class Preferences extends ChangeNotifier {

  // Keys to use with shared preferences.
  static const _caloriesKey = 'calories';
  //TODO Add channels

  // Indicates whether a call to [_loadFromSharedPrefs] is in progress;
  Future<void> _loading;

  int _desiredCalories = 2000;


  Future<int> get desiredCalories async {
    await _loading;
    return _desiredCalories;
  }


  Future<void> setDesiredCalories(int calories) async {
    _desiredCalories = calories;
    await _saveToSharedPrefs();
    notifyListeners();
  }

  void load() {
    _loading = _loadFromSharedPrefs();
  }

  Future<void> _saveToSharedPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_caloriesKey, _desiredCalories);
  }

  Future<void> _loadFromSharedPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    _desiredCalories = prefs.getInt(_caloriesKey) ?? 2000;
    notifyListeners();
  }
}