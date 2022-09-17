import 'package:easy_localization/easy_localization.dart';
import 'package:formz/formz.dart';
import 'package:ushop/utils/validator.dart';
import 'package:validators/validators.dart';

enum EmailValidationError { empty, invalid }

class Email extends FormzInput<String, String> {
  const Email.pure() : super.pure('');
  const Email.dirty([String value = '']) : super.dirty(value);

  @override
  String? validator(String? value) {
    if (value != null) {
      List<Map<String, dynamic>> validators = [
        {
          "validator": value.isNotEmpty,
          "errorMessage": "please_enter_a_value".tr(),
        },
        {
          "validator": matches(value,
              r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$'),
          "errorMessage": "please_enter_a_valid_email".tr(),
        },
      ];

      return validation(validators);
    }
    return null;
  }
}
