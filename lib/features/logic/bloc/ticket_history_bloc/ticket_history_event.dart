part of 'ticket_history_bloc.dart';

@immutable
abstract class TicketHistoryEvent {}



class FetchTokenHistory extends TicketHistoryEvent{
  FetchTokenHistory({required this.firstName, required this.lastName ,required this.surname});
  final String lastName;
  final String firstName;
  final String surname;

}