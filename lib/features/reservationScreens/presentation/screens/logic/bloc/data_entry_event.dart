// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'data_entry_bloc.dart';

abstract class DataEntryEvent {}

class DateTextFields extends DataEntryEvent {
  final String surname;
  final String name;
  final String patronymic;
  final String dateOfBirth;
  final String pasport;

  DateTextFields({
    required this.surname,
    required this.name,
    required this.patronymic,
    required this.dateOfBirth,
    required this.pasport,
  
  });
}
