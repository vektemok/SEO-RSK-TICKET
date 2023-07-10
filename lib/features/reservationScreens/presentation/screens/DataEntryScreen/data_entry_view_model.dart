import 'package:flutter/cupertino.dart';

class DataEntryViewModel extends ChangeNotifier{
  final String _headerText = 'Пожалуйста, укажите \n'
      'следующие данные';

  List<String> _headerTextList = [
    'Фамилия:',
    'Имя:',
    'Отчество:',
    'Дата рождения:',
    'ID пасспорт:',
  ];



  List<String> get headerTextList => _headerTextList;
  String get headerText => _headerText;

}