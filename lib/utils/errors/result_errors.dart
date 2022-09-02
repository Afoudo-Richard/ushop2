class ErrorGettingArticles implements Exception {
  ErrorGettingArticles(String error);
}

class ErrorEmptyResponse implements Exception {}

class ErrorGettingAppointments implements Exception {
  ErrorGettingAppointments(String error);
}

class ErrorRegistering implements Exception {
  ErrorRegistering({this.message, required this.errors});
  final String? message;
  final Map<String, dynamic> errors;
}

class ErrorLoggingIn implements Exception {
  ErrorLoggingIn({this.message});
  final String? message;
}

class ErrorLeavingReview implements Exception {
  ErrorLeavingReview({this.message});
  final String? message;
}

class ErrorGettingMedicalProfessional implements Exception {
  ErrorGettingMedicalProfessional({this.message});
  final String? message;
}

class ErrorCreatingMedicalProfessional implements Exception {
  ErrorCreatingMedicalProfessional({this.message, required this.errors});
  final String? message;
  final Map<String, dynamic> errors;
}
