import 'package:easy_localization/easy_localization.dart';
import 'package:formz/formz.dart';
import 'package:ushop/utils/validator.dart';
import 'package:validators/validators.dart';

enum PasswordValidationError { empty, invalidLength }

class Password extends FormzInput<String, String> {
  const Password.pure() : super.pure('');
  const Password.dirty([String value = '']) : super.dirty(value);

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
              r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{6,}$"),
          "errorMessage": "password_invalid_error".tr(),
        },
      ];

      return validation(validators);
    }
    return null;
  }
}
