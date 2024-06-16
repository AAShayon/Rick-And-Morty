import 'package:flutter/material.dart';
import 'package:rick_morty/Modules/character/model/core/response_model/character_list_response_model.dart';

class LandingViewModel with ChangeNotifier {
  int _currentIndex = 0;
  Character? _character;

  int get currentIndex => _currentIndex;
  Character? get character=> _character;

  void selectCharacter(Character character) {
   _character=character;
    _currentIndex = 1;
    notifyListeners();
  }

  void setCurrentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
  void deselectCharacter() {
   _character=null;
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
