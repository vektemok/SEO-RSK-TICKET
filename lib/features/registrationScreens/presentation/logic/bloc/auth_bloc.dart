import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:united102/features/registrationScreens/domain/use_cases/auth_use_case.dart';

import '../../../../../iternal/catch_exception_helper.dart';
import '../../../data/models/client.model.dart';
import '../../../data/models/login_model.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthUseCase useCase;
  AuthBloc(this.useCase) : super(AuthInitial()) {
    on<AuthEvent>((event, emit) {});

    on<RegistrationEvent>((event, emit) async {
      emit(AuthLoadingState());

      await useCase
          .getRegistration(event.email, event.username, event.password)
          .then(
            (value) => emit(
              SuccessRegistrationLoadedState(),
            ),
          )
          .onError((error, stackTrace) => emit(
              AuthErrorState(error: CatchException.convertException(error))));
    });
    
  }
}
