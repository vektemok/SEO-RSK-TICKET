// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:injectable/injectable.dart';
import 'package:united102/features/reservationScreens/data/model/bookingModel.dart';

import 'package:united102/features/reservationScreens/domain/repositories/data_entry_repository.dart';

@injectable
class DataEntryUseCase {
  final DataEntryRepository dataRepository;

  DataEntryUseCase({required this.dataRepository});

  
  Future<BookingModel> getDataEntry(
    String name,
    String surname,
    String patronymic,
    String dateOfBirth,
    String pasport,
  ) async =>
      await dataRepository.getDataEntry(
        name,
        surname,
        patronymic,
        dateOfBirth,
        pasport,
      );

 
}
