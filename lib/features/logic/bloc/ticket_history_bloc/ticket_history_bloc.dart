import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import '../../../ticketHistoryScreens/presentation/model/ticket_history_model.dart';

part 'ticket_history_event.dart';

part 'ticket_history_state.dart';

class TicketHistoryBloc extends Bloc<TicketHistoryEvent, TicketHistoryState> {
  TicketHistoryBloc() : super(TicketHistoryInitial()) {
    on<FetchTokenHistory>((event, emit) async {
      final response = await http.get(
          Uri.parse('http://35.228.114.191/profile/user_history/'),
          headers: {
            "first_name": event.firstName,
            "last_name": event.lastName,
            "surname": event.surname
          });
    });
  }
}
