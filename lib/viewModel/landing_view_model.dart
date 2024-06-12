import 'package:flutter/material.dart';

class LandingViewModel with ChangeNotifier {
  int _currentIndex = 0;
  String? _selectedCharacter;

  int get currentIndex => _currentIndex;
  String? get selectedCharacter => _selectedCharacter;

  void selectCharacter(String characterName) {
    _selectedCharacter = characterName;
    _currentIndex = 1;
    notifyListeners();
  }

  void setCurrentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
  void deselectCharacter() {
    _selectedCharacter = null;
    _currentIndex = 0;
    notifyListeners();
  }
  void goBackToPreviousIndex() {
    if (_currentIndex > 0) {
      _currentIndex = 0;
      notifyListeners();
    }
  }
}
