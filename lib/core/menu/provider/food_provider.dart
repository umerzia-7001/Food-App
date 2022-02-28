import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../model/model.dart';

class FoodViewModel extends ChangeNotifier {
  String _currentFilter = DummyInfo.tags[0];
  String get currentFilter => _currentFilter;

// list to store the data from firestore to display in UI
  final List<FoodItems> filteredFoods = [];

// setter for curretn selected tag
  set currentFilter(String currentFillter) {
    _currentFilter = currentFillter;
    notifyListeners();
  }

  void initList() async {
    final QuerySnapshot<Map<String, dynamic>> result =
        await FirebaseFirestore.instance.collection('Foods').get();
    final List<DocumentSnapshot> resultDocument = result.docs;

    filteredFoods.clear();

    // iterating through all documents from firestore and adding it to our model
    resultDocument.forEach((value) {
      FoodItems item = FoodItems(
          name: value['name'],
          image: value['image'],
          cuisine: value['cuisine']);
      filteredFoods.add(item);
    });
    notifyListeners();
  }

  getData(int type) async {
    String select = '';

// mapping the filter w.r.t cuisine filter type
    switch (type) {
      case 1:
        select = 'italian';
        break;
      case 2:
        select = 'mexican';
        break;

      case 3:
        select = 'indian';
        break;
    }

    final QuerySnapshot<Map<String, dynamic>> result =
        await FirebaseFirestore.instance
            .collection('Foods')
            .where(
              'cuisine',
              isEqualTo: select,
            )
            .get();
    final List<DocumentSnapshot> resultDocument = result.docs;

    // iterating through filtered documents w.r.t cuisine type  and adding it to our model
    filteredFoods.clear();
    resultDocument.forEach((value) {
      FoodItems item = FoodItems.fromSnapshot(value);
      filteredFoods.add(item);
    });
    notifyListeners();
  }
}

// dummy data
mixin DummyInfo {
  // For filter selector
  static List<String> tags = [
    "All",
    "italian",
    "mexican",
    "indian",
  ];
}
