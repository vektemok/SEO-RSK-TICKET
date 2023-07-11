import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:united102/features/reservationScreens/data/model/bookingModel.dart';
import 'package:united102/iternal/api_requester.dart';

import '../../../../iternal/catch_exception_helper.dart';
import '../../domain/repositories/data_entry_repository.dart';

@Injectable(as: DataEntryRepository)

class DataEntryImpl implements DataEntryRepository {
  ApiRequester apiRequester = ApiRequester();

  @override
  Future<BookingModel> getDataEntry(String name, String surname,
      String patronymic, String dateOfBirth, String pasport) async {
    try {
      Response response = await apiRequester.toPost(
        "booking/",
        data: {
          "first_name": name,
          "last_name": surname,
          "surname": patronymic,
          "pasport": dateOfBirth,
          "phone_number": pasport,
          "queque": 1,
        },
      );
      if (response.statusCode == 200) {
        log('postDataEntry statusCode === ${response.statusCode}');
          BookingModel model = BookingModel.fromJson(response.data);
        return model;
      }

      throw response;
    } catch (e) {
      throw CatchException.convertException(e);
    }
  }
}
