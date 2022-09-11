import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:easy_localization/easy_localization.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(SettingsState()) {
    on<SettingsLanguageChanged>(_onSettingsLanguageChanged);
  }

  void _onSettingsLanguageChanged(
      SettingsLanguageChanged event, Emitter<SettingsState> emit) {
    emit(state.copyWith(locale: event.locale));
  }
}
