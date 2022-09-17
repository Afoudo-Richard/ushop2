import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:ushop/data/data.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState()) {
    on<LoginEmailChanged>(_onEmailChanged);
    on<LoginPasswordChanged>(_onPasswordChanged);
    on<LoginSubmitted>(_onSubmitted);
    on<SubmitInputsChecked>(_onSubmitInputsChecked);
  }

  void _onEmailChanged(
    LoginEmailChanged event,
    Emitter<LoginState> emit,
  ) {
    final email = Email.dirty(event.email);
    emit(state.copyWith(
      email: email,
      status: Formz.validate([state.password, email]),
    ));
  }

  void _onPasswordChanged(
    LoginPasswordChanged event,
    Emitter<LoginState> emit,
  ) {
    final password = LoginPassword.dirty(event.password);
    emit(state.copyWith(
      password: password,
      status: Formz.validate([password, state.email]),
    ));
  }

  void _onSubmitInputsChecked(
    SubmitInputsChecked event,
    Emitter<LoginState> emit,
  ) {
    emit(state.copyWith(
      email: Email.dirty(state.email.value),
      password: LoginPassword.dirty(state.password.value),
      status: Formz.validate([state.password, state.email]),
    ));
  }

  void _onSubmitted(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    if (state.status.isValidated) {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      try {
        // your api call here
        await Future.delayed(const Duration(seconds: 2));

        emit(state.copyWith(status: FormzStatus.submissionSuccess));
      } catch (_) {
        // catch with submition failure in case of any error.
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    }
  }
}
