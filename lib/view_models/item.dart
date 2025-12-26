import 'package:flutter/material.dart';
import '../models/item.dart';
import '../services/item.dart';

class ItemViewModel extends ChangeNotifier {
  String? error;
  int? selectedId;
  bool isLoading = false;
  List<Item> items = [];

  Future<void> loadItems({bool shouldFail = false}) async {
    isLoading = true;
    error = null;
    notifyListeners();

    try {
      items = await fetchItem(shouldFail: shouldFail);
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void setSelectedId({int? id}) {
    if (selectedId != id) {
      selectedId = id;
      notifyListeners();
    }
  }
}
