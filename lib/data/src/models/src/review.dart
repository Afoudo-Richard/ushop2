import 'package:ushop/data/src/models/src/user.dart';

class Review {
  final User user;
  final String review;
  final double rating;
  final String date_posted;
  Review({
    required this.user,
    required this.review,
    required this.rating,
    required this.date_posted,
  });
}
