import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/routes/routes.dart';

class CategoriesViewModel extends ChangeNotifier {
  final List<String> _categories = [
    'Физические лица',
    'Юридическе лица',
    'Платежные карты'
  ];

  final List<String> _pushPath = [
    Routes.serviceSelectScreen,
  ];
  int _currentIndex = 0;

  void changeCategory(int index ) {
    _currentIndex = index;
    notifyListeners();
  }

  List<String> get categories => _categories;

  List<String> get pushPath => _pushPath;

  int get currentIndex => _currentIndex;
}
