part of 'theme_bloc.dart';

@immutable
abstract class ThemeState {
  ThemeState({required this.currentTheme});

  final ThemeData currentTheme;
}



class BlackThemeState extends ThemeState {
  BlackThemeState({required super.currentTheme});
}

class WhiteThemeState extends ThemeState {
  WhiteThemeState({required super.currentTheme});
}
