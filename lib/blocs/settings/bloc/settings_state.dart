// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'settings_bloc.dart';

class SettingsState extends Equatable {
  final Locale locale;

  const SettingsState({
    this.locale = const Locale('en', "US"),
  });

  @override
  List<Object> get props => [locale];

  SettingsState copyWith({
    Locale? locale,
  }) {
    return SettingsState(
      locale: locale ?? this.locale,
    );
  }
}
