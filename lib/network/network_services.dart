import 'dart:convert';

import 'package:aplikasi_berita/model/model_news.dart';
import 'package:http/http.dart' as http;

//get data API
class NetworkService {
  static Future<List<ModelNews>> fetchNews(String kategori) async {
    String baseUrl = 'https://api-berita-indonesia.vercel.app/antara/$kategori';
    try {
      final response = await http.get(Uri.parse(baseUrl));
      List listData =
          (jsonDecode(response.body) as Map<String, dynamic>)['data']['posts'];
      var dataNews = ModelNews.fromJsonList(listData);
      return dataNews;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
