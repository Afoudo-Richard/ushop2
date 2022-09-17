import 'package:easy_localization/easy_localization.dart';
import 'package:formz/formz.dart';
import 'package:ushop/utils/validator.dart';

enum FirstNameValidationError { empty }

class FirstName extends FormzInput<String, String> {
  const FirstName.pure() : super.pure('');
  const FirstName.dirty([String value = '']) : super.dirty(value);

  @override
  String? validator(String? value) {
    if (value != null) {
      List<Map<String, dynamic>> validators = [
        {
          "validator": value.isNotEmpty,
          "errorMessage": "please_enter_a_value".tr(),
        },
      ];

      return validation(validators);
    }
    return null;
  }
}
