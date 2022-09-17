import 'package:easy_localization/easy_localization.dart';
import 'package:formz/formz.dart';
import 'package:validators/validators.dart';

enum ConfirmPasswordValidationError {
  invalid,
  mismatch,
}

class ConfirmPassword extends FormzInput<String, String> {
  final String password;

  const ConfirmPassword.pure({this.password = ''}) : super.pure('');

  const ConfirmPassword.dirty({required this.password, String value = ''})
      : super.dirty(value);

  @override
  String? validator(String? value) {
    if (value != null) {
      List<Map<String, dynamic>> validators = [
        {
          "validator": value.isNotEmpty,
          "errorMessage": "Empty value".tr(),
        },
        {
          "validator": equals(value, password),
          "errorMessage": "Confirm password must be same as password"
        },
      ];

      return validation(validators);
    }
    return null;
  }

  String? validation(List validators) {
    String? erroMessage;
    for (var item in validators) {
      if (item['validator'] == false) {
        erroMessage = item['errorMessage'];
        break;
      }
    }

    return erroMessage;
  }
}
