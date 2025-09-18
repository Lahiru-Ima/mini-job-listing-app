import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  static const _key = 'themeMode';
  final SharedPreferences prefs;
  ThemeCubit(this.prefs) : super(const ThemeState(ThemeMode.system));

  Future<void> load() async {
    final value = prefs.getString(_key);
    switch (value) {
      case 'light':
        emit(const ThemeState(ThemeMode.light));
        break;
      case 'dark':
        emit(const ThemeState(ThemeMode.dark));
        break;
      default:
        emit(const ThemeState(ThemeMode.system));
    }
  }

  Future<void> setTheme(ThemeMode mode) async {
    emit(ThemeState(mode));
    await prefs.setString(_key, _encode(mode));
  }

  String _encode(ThemeMode m) => m == ThemeMode.light
      ? 'light'
      : m == ThemeMode.dark
      ? 'dark'
      : 'system';
}
