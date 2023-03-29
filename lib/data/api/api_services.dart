import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/articles.dart';

class ApiService {
  static final String _baseUrl = 'https://newsapi.org/v2/';
  static final String _apiKey = '5e72d82a1eab4cda8282a0fc43e81bd3';
  static final String _category = 'sports';
  static final String _country = 'id';

  Future<ArticleResult> topHeadlines() async {
    final response = await http.get(Uri.parse(_baseUrl +
      "top-headlines?country=$_country&category=$_category&apiKey=$_apiKey"
    ));

    if(response.statusCode == 200) {
      return ArticleResult.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to load top headlines");
    }
  }
}