import 'package:formz/formz.dart';

enum DateValidationError { empty }

class Date extends FormzInput<String, DateValidationError> {
  const Date.pure() : super.pure('');
  const Date.dirty([String value = '']) : super.dirty(value);

  @override
  DateValidationError? validator(String? value) {
    return value?.isNotEmpty == true ? null : DateValidationError.empty;
  }
}
