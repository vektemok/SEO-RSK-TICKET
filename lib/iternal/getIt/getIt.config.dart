// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/registrationScreens/data/repositories/auth_repository_impl.dart'
    as _i4;
import '../../features/registrationScreens/domain/repositories/auth_repositories.dart'
    as _i3;
import '../../features/registrationScreens/domain/use_cases/auth_use_case.dart'
    as _i5;
import '../../features/registrationScreens/presentation/logic/bloc/auth_bloc.dart'
    as _i6;

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.factory<_i3.AuthRepository>(() => _i4.AuthRepositoryImpl());
  gh.factory<_i5.AuthUseCase>(
      () => _i5.AuthUseCase(authRepository: gh<_i3.AuthRepository>()));
  gh.factory<_i6.AuthBloc>(() => _i6.AuthBloc(gh<_i5.AuthUseCase>()));
  return getIt;
}
