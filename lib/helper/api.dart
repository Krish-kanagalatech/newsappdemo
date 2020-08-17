import 'dart:convert';

import 'package:http/http.dart' as http;

import '../podo/category.dart';

class Api {
  static String baseURL =  "http://206.189.143.159/news-demo/";
  static String popular = baseURL + "api.php?get=top&business_id=100001";
  static String breaking = baseURL + "api.php?get=breaking&business_id=100001";
  static String trends = baseURL + "api.php?get=trends&business_id=100001";
  static String searchUrl = baseURL + "api.php?get=search&char=";
  static String imageURL = baseURL + "images/";

  static Future<CategoryFeed> getNews(String url) async {
    var res = await http.get(url);
    CategoryFeed category;
    if (res.statusCode == 200) {
      final jsonResponse = json.decode(res.body);
      category = CategoryFeed.fromJson(jsonResponse);
    } else {
      throw ("Error ${res.statusCode}");
    }
    return category;
  }

  static Future<bool> updateCount(String url) async {
    var res = await http.get(url);
    if (res.statusCode == 200) {
    } else {
      throw ("Error ${res.statusCode}");
    }
    return true;
  }
}
