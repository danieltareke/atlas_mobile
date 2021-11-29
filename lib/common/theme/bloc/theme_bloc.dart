import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeInitial()) {
    on<ThemeDarkened>(_onThemeDarkened);
    on<ThemeLightened>(_onThemeLightened);
  }

  void _onThemeDarkened(ThemeEvent event, Emitter<ThemeState> emit) {
    emit(ThemeDark());
  }

  void _onThemeLightened(ThemeEvent event, Emitter<ThemeState> emit) {
    emit(ThemeLight());
  }
}
