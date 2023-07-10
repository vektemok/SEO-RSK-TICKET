import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

class ServiceSelectViewModel extends ChangeNotifier {
  final List<String> _categories = [
    'Отрытие корпаративного счета',
    'Отрытие корпаративного счета',
    'Отрытие корпаративного счета',
    'Отрытие корпаративного счета',
    'Отрытие корпаративного счета',
    'Отрытие корпаративного счета',
  ];
  int _currentIndex = 0;

  List<String> get categories => _categories;

  int get currentIndex => _currentIndex;

  void _changeCategory(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
