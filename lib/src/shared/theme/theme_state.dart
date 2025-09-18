part of 'theme_cubit.dart';

class ThemeState extends Equatable {
  final ThemeMode mode;
  const ThemeState(this.mode);

  @override
  List<Object?> get props => [mode];
}
