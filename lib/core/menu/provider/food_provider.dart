import 'package:flutter/material.dart';

import '../../../config/dummy_into.dart';

class FoodViewModel extends ChangeNotifier {
  String _currentFilter = DummyInfo.tags[0];

  String get currentFilter => _currentFilter;

  set currentFilter(String currentFillter) {
    _currentFilter = currentFillter;
    notifyListeners();
  }

  final Map<String, int> _tagNumbers = {
    "italian": 0,
    "mexican": 0,
    "indian": 0,
  };

  Map<String, int> get tagNumbers => _tagNumbers;
}
