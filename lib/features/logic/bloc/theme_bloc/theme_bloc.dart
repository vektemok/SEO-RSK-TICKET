import 'dart:async';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:united102/iternal/themes/black_theme.dart';
import 'package:united102/iternal/themes/white_theme.dart';

part 'theme_event.dart';

part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(WhiteThemeState(currentTheme: whiteTheme)) {
    on<ChangeWhiteTheme>(
        (event, emit) => emit(WhiteThemeState(currentTheme: whiteTheme)));
    on<ChangeBlackTheme>(
        (event, emit) => emit(BlackThemeState(currentTheme: blackTheme)));
  }
}
