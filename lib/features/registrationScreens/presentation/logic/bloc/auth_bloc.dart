import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../../iternal/catch_exception_helper.dart';
import '../../../data/models/login_model.dart';
import '../../../domain/use_cases/auth_use_case.dart';

part 'auth_event.dart';
part 'auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthUseCase useCase;
  AuthBloc(this.useCase) : super(AuthInitial()) {
    on<AuthEvent>((event, emit) {});

    on<LogInEvent>((event, emit) async {
      emit(AuthLoadingState());

      await useCase
          .getLogIn(event.email, event.password)
          .then((loginModel) => emit(SuccessLogInState(loginModel: loginModel)))
          .onError((error, stackTrace) => emit(
              AuthErrorState(error: CatchException.convertException(error))));
    });

    on<RegistrationEvent>((event, emit) async {
      emit(AuthLoadingState());

      await useCase
          .getRegistration(event.email, event.name, event.password)
          .then((value) => emit(SuccessRegistatrionLoadedState()))
          .onError((error, stackTrace) => emit(
              AuthErrorState(error: CatchException.convertException(error))));
    });
  }
}