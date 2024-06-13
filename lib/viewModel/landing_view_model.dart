import 'package:flutter/material.dart';
import 'package:ricky_monty/Modules/character/model/core/response_model/character_list_response_model.dart';

class LandingViewModel with ChangeNotifier {
  int _currentIndex = 0;
  Results? _results;

  int get currentIndex => _currentIndex;
  Results? get results=> _results;

  void selectCharacter(Results results) {
   _results=results;
    _currentIndex = 1;
    notifyListeners();
  }

  void setCurrentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
  void deselectCharacter() {
   _results=null;
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
