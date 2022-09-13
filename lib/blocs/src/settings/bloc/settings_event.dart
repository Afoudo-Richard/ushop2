part of 'settings_bloc.dart';

@immutable
abstract class SettingsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SettingsLanguageChanged extends SettingsEvent {
  final Locale locale;

  SettingsLanguageChanged({
    required this.locale,
  });

  @override
  List<Object?> get props => [locale];
}
