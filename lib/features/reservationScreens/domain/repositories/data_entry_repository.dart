import 'package:united102/features/reservationScreens/data/model/bookingModel.dart';

abstract class DataEntryRepository{
  Future<BookingModel> getDataEntry(
    String name,
    String surname,
    String patronymic,
    String dateOfBirth,
    String pasport,
  );
}