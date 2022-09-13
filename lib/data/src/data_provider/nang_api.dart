import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:ushop/utils/errors/result_errors.dart';

class NangApi {
  // development
  // final String baseUrl =
  //     'http://nang-health.projects.support.whilesmart.com/api';

  // production
  final String baseUrl = 'https://nanghealth.com/api';

  Uri getUrl({required String url, Map<String, String>? extraParameters}) {
    return Uri.parse('$baseUrl/$url').replace(
      queryParameters: extraParameters,
    );
  }

  // fetch articles //
  Future<Map<String, dynamic>> fetchArticles(
      {int page = 1, int limit = 10}) async {
    try {
      final articlesResponse = await http.get(
        getUrl(
          url: 'articles',
          extraParameters: {
            'limit': limit.toString(),
            'order': 'desc',
            'page': page.toString(),
          },
        ),
      );

      if (articlesResponse.statusCode == 200) {
        return json.decode(articlesResponse.body);
      } else {
        throw ErrorGettingArticles("Error Fetching articles");
      }
    } catch (e) {
      throw ErrorGettingArticles("Error Fetching articles");
    }
  }

  // search articles //
  Future<Map<String, dynamic>> searchArticles(String searchText) async {
    try {
      final articlesResponse = await http.get(
        getUrl(
          url: 'search/articles',
          extraParameters: {
            'search': searchText,
          },
        ),
      );

      if (articlesResponse.statusCode == 200) {
        return json.decode(articlesResponse.body);
      } else {
        throw ErrorGettingArticles("Error Fetching articles");
      }
    } catch (e) {
      throw ErrorGettingArticles("Error Fetching articles");
    }
  }

  // fetch appointments //
  Future<Map<String, dynamic>> fetchAppointments([int startIndex = 0]) async {
    const limit = 20;
    try {
      final response = await http.get(
        getUrl(
          url: 'appointments',
          extraParameters: {'limit': '$limit'},
        ),
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw ErrorGettingAppointments("Error Fetching appointments");
      }
    } catch (e) {
      throw ErrorGettingAppointments("Error Fetching appointments");
    }
  }

  // register user //

  Future registration({
    required String firstname,
    required String lastname,
    required String email,
    required String phone,
    required String password,
  }) async {
    try {
      final response = await http.post(
        getUrl(url: 'auth/register'),
        headers: <String, String>{
          "Content-Type": "application/json",
          "accept": "application/json",
        },
        body: json.encode(
          {
            "first_name": firstname,
            "last_name": lastname,
            "email": email,
            "phone": phone,
            'password': password,
            'password_confirmation': password,
          },
        ),
      );

      final response_body = json.decode(response.body);

      switch (response.statusCode) {
        case 200:
          return response_body;
        case 500:
          throw ErrorRegistering(
            message: response_body['message'],
            errors: {},
          );
        case 422:
          throw ErrorRegistering(
            message: response_body['message'],
            errors: response_body['errors'],
          );
        default:
          throw ErrorRegistering(
            message: response_body['message'],
            errors: response_body['errors'],
          );
      }
    } on ErrorRegistering catch (e) {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  // login user //

  Future login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await http.post(
        getUrl(url: 'auth/login'),
        headers: <String, String>{
          "Content-Type": "application/json",
          "accept": "application/json",
        },
        body: json.encode(
          {
            "email": email,
            'password': password,
          },
        ),
      );
      final response_body = json.decode(response.body);
      if (response.statusCode == 200) {
        return response_body;
      } else {
        throw ErrorLoggingIn(message: response_body['message']);
      }
    } on ErrorLoggingIn catch (e) {
      rethrow;
    } catch (e) {
      throw ErrorLoggingIn(message: "Error logging in");
    }
  }

  // forgot password //

  Future forgotPassword({
    required String email,
  }) async {
    try {
      final response = await http.post(
        getUrl(url: 'auth/password/forgot'),
        headers: <String, String>{
          "Content-Type": "application/json",
          "accept": "application/json",
        },
        body: json.encode(
          {
            "email": email,
          },
        ),
      );
      final response_body = json.decode(response.body);
      if (response.statusCode == 200) {
        return response_body;
      } else {
        throw ErrorLoggingIn(message: response_body['message']);
      }
    } on ErrorLoggingIn catch (e) {
      rethrow;
    } catch (e) {
      throw ErrorLoggingIn(message: "Error logging in");
    }
  }
  // leave a review //

  Future leaveReview({
    required int articleId,
    required double rating,
    required String review,
    required String userToken,
  }) async {
    try {
      final response = await http.post(
        getUrl(url: 'articles/reviews/new'),
        headers: <String, String>{
          "Content-Type": "application/json",
          "Authorization": 'Bearer $userToken',
          "accept": "application/json",
        },
        body: json.encode(
          {
            "article_id": articleId,
            'rating': rating,
            'comment': review,
          },
        ),
      );
      final response_body = json.decode(response.body);
      if (response.statusCode == 201) {
        return response_body;
      } else {
        throw ErrorLeavingReview(message: response_body['message']);
      }
    } on ErrorLeavingReview catch (e) {
      print(e);
      rethrow;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } catch (e) {
      throw ErrorLeavingReview(message: "Error sending reviews");
    }
  }

  // fetch articles reviews //
  Future<Map<String, dynamic>> fetchReview(int articleId,
      {int page = 1, int limit = 5}) async {
    try {
      final articlesResponse = await http.get(
        getUrl(url: 'articles/$articleId/reviews', extraParameters: {
          'limit': limit.toString(),
          'page': page.toString(),
        }),
      );

      if (articlesResponse.statusCode == 200) {
        return json.decode(articlesResponse.body);
      } else {
        throw ErrorGettingArticles("Error Fetching articles");
      }
    } catch (e) {
      print(e.toString());
      throw ErrorGettingArticles("Error Fetching articles");
    }
  }

  // fetch medical professional //
  Future<Map<String, dynamic>> fetchMedicalProfessionals(
      {int page = 1, int limit = 10}) async {
    try {
      final articlesResponse = await http.get(
        getUrl(
          url: 'medical-professionals',
          extraParameters: {
            'limit': limit.toString(),
            'order': 'desc',
            'page': page.toString(),
          },
        ),
      );

      if (articlesResponse.statusCode == 200) {
        return json.decode(articlesResponse.body);
      } else {
        throw ErrorGettingMedicalProfessional(
          message: "Error Fetching articles",
        );
      }
    } catch (e) {
      throw ErrorGettingMedicalProfessional(
        message: "Error Fetching articles",
      );
    }
  }

  // create medical professional //

  Future createMedicalProfessional({
    required String name,
    required String email,
    required String phone,
    required String about,
    File? photo,
  }) async {
    try {
      final response = await http.post(
        getUrl(url: 'medical-professionals'),
        headers: <String, String>{
          "Content-Type": "application/json",
          "accept": "application/json",
        },
        body: json.encode(
          {
            "name": name,
            "email": email,
            "phone": phone,
            "about": about,
          },
        ),
      );

      final response_body = json.decode(response.body);

      switch (response.statusCode) {
        case 200:
          return response_body;
        case 500:
          throw ErrorCreatingMedicalProfessional(
            message: response_body['message'],
            errors: {},
          );
        case 422:
          throw ErrorCreatingMedicalProfessional(
            message: response_body['message'],
            errors: response_body['errors'],
          );
        default:
          throw ErrorCreatingMedicalProfessional(
            message: response_body['message'],
            errors: response_body['errors'],
          );
      }
    } on ErrorCreatingMedicalProfessional catch (e) {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}
