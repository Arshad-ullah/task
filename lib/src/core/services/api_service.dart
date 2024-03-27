import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'package:task/src/core/expcetion/custom_exception.dart';
import 'package:task/src/core/models/coments_model.dart';
import 'package:task/src/utils/api_const.dart';

class ApiService {
  Future<List<CommentModel>> getComment() async {
    try {
      final response = await http
          .get(Uri.parse(commentBaseUrl))
          .timeout(const Duration(seconds: 60));

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        return data.map((json) => CommentModel().fromJson(json)).toList();
      } else {
        throw CustomException('Server error');
      }
    } on FormatException {
      throw CustomException('Response format error');
    } on SocketException {
      throw CustomException('Network error');
    } on TimeoutException {
      throw CustomException('Request timed out');
    } on HttpException {
      throw CustomException('HTTP request error');
    } catch (e) {
      throw CustomException('Unexpected error: $e');
    }
  }
}
