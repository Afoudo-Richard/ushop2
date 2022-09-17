import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:ushop/presentation/pages/home/views/home_page.dart';

part 'app_bottom_navigation_bar_event.dart';
part 'app_bottom_navigation_bar_state.dart';

class AppBottomNavigationBarBloc
    extends Bloc<AppBottomNavigationBarEvent, AppBottomNavigationBarState> {
  AppBottomNavigationBarBloc() : super(AppBottomNavigationBarState()) {
    on<AppBottomNavigationBarChanged>(_onAppBottomNavigationBarChanged);
  }

  Future<void> _onAppBottomNavigationBarChanged(
    AppBottomNavigationBarChanged event,
    emit,
  ) async {
    emit(state.copyWith(activePage: event.activePage));
  }
}
