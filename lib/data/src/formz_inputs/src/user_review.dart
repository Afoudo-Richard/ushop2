import 'package:formz/formz.dart';

enum UserReviewValidationError { empty }

class UserReview extends FormzInput<String, UserReviewValidationError> {
  const UserReview.pure() : super.pure('');
  const UserReview.dirty([String value = '']) : super.dirty(value);

  @override
  UserReviewValidationError? validator(String? value) {
    return value?.isNotEmpty == true ? null : UserReviewValidationError.empty;
  }
}
