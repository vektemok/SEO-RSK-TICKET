import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:united102/features/reservationScreens/data/model/bookingModel.dart';
import 'package:united102/features/reservationScreens/domain/use_case/data_entry_use_case.dart';

import '../../../../../../iternal/catch_exception_helper.dart';

part 'data_entry_event.dart';
part 'data_entry_state.dart';

@injectable
class DataEntryBloc extends Bloc<DataEntryEvent, DataEntryState> {
  final DataEntryUseCase useCase;
  DataEntryBloc(this.useCase) : super(DataEntryInitial()) {
    on<DataEntryEvent>((event, emit) {});

    on<DateTextFields>(
      (event, emit) async {
        emit(DataEntryLoadingState());
        await useCase
            .getDataEntry(event.surname, event.name, event.patronymic,
                event.dateOfBirth, event.pasport)
            .then((bookingModel) =>
                emit(DataEntryLoadeddState(bookingModel: bookingModel)))
            .onError((error, stackTrace) => emit(DataEntryFailedState(
                error: CatchException.convertException(error))));
      },
    );
  }
}
