part of 'theme_bloc.dart';

@immutable
abstract class ThemeEvent {}


class ChangeBlackTheme extends ThemeEvent{}
class ChangeWhiteTheme extends ThemeEvent{}