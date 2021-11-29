part of 'theme_bloc.dart';

abstract class ThemeState extends Equatable {
  final ThemeMode selectedTheme;
  const ThemeState(this.selectedTheme);

  @override
  List<Object> get props => [selectedTheme];
}

class ThemeInitial extends ThemeState {
  ThemeInitial({selectedTheme = ThemeMode.light}) : super(selectedTheme);
}

class ThemeLight extends ThemeState {
  ThemeLight({selectedTheme = ThemeMode.light}) : super(selectedTheme);
}

class ThemeDark extends ThemeState {
  ThemeDark({selectedTheme = ThemeMode.dark}) : super(selectedTheme);
}
