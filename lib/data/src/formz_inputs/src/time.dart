import 'package:formz/formz.dart';

enum TimeValidationError { empty }

class Time extends FormzInput<String, TimeValidationError> {
  const Time.pure() : super.pure('');
  const Time.dirty([String value = '']) : super.dirty(value);

  @override
  TimeValidationError? validator(String? value) {
    return value?.isNotEmpty == true ? null : TimeValidationError.empty;
  }
}
