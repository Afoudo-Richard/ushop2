// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ushop/data/models/user.dart';

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
