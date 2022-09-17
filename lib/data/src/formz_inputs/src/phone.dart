import 'package:easy_localization/easy_localization.dart';
import 'package:formz/formz.dart';
import 'package:ushop/utils/validator.dart';
import 'package:validators/validators.dart';

enum PhoneValidationError { empty }

class Phone extends FormzInput<String, String> {
  const Phone.pure() : super.pure('');
  const Phone.dirty([String value = '']) : super.dirty(value);

  @override
  String? validator(String? value) {
    if (value != null) {
      List<Map<String, dynamic>> validators = [
        {
          "validator": value.isNotEmpty,
          "errorMessage": "please_enter_a_value".tr(),
        },
        {
          "validator": isLength(value, 9),
          "errorMessage": "value_must_be_9_characters".tr(),
        },
      ];

      return validation(validators);
    }
    return null;
  }
}
