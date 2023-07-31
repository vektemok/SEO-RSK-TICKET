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


  List<String> get categories => _categories;




}
