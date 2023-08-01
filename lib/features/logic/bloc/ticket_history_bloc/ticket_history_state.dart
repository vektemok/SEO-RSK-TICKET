part of 'ticket_history_bloc.dart';

@immutable
abstract class TicketHistoryState {}

class TicketHistoryInitial extends TicketHistoryState {}


class TicketHistoryLoaded extends TicketHistoryState{
  TicketHistoryLoaded({required this.tokenHistory});
  List<TokenHistory> tokenHistory ;
}
