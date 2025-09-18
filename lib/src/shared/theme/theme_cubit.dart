import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  static const _key = 'themeMode';
  final SharedPreferences prefs;

  ThemeCubit(this.prefs) : super(const ThemeState(ThemeMode.light));

  Future<void> load() async {
    final value = prefs.getString(_key);
    final mode = value == 'dark' ? ThemeMode.dark : ThemeMode.light;
    emit(ThemeState(mode));
  }

  Future<void> setTheme(ThemeMode mode) async {
    emit(ThemeState(mode));
    await prefs.setString(_key, mode == ThemeMode.dark ? 'dark' : 'light');
  }

  Future<void> toggleTheme() async {
    final newMode = state.mode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    await setTheme(newMode);
  }
}
