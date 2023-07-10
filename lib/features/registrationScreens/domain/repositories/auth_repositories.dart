import 'package:united102/features/registrationScreens/data/models/client.model.dart';

import '../../data/models/login_model.dart';

abstract class AuthRepository {
 Future<ClientModel> getRegistration(String email, String username, String password);
 Future<LoginModel> getLogIn(String username, String password);
}