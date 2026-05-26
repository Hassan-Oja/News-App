import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Model/news_response.dart';
import '../Model/source_response.dart';
import 'api_constants.dart';
import 'end_points.dart';

class ApiManager {
  static Future<SourceResponse?> getSources() async {
    var url = Uri.https(ApiConstants.baseURL, EndPoints.sources, {
      'apiKey': ApiConstants.ApiKey,
    });
    try {
      var response = await http.get(url);
      var responseBody = response.body; // String
      var Json = jsonDecode(responseBody); // json
      return SourceResponse.fromJson(Json);
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<NewsResponse?> getNews(String sourceID) async {
    var url = Uri.https(ApiConstants.baseURL, EndPoints.news, {
      'apiKey': ApiConstants.ApiKey,
      'sources': sourceID,
    });
    try {
      var response = await http.get(url);
      var responseBody = response.body; // String
      var Json = jsonDecode(responseBody); // json
      return NewsResponse.fromJson(Json);
    } catch (e) {
      throw Exception(e);
    }
  }
}
