import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_10/model/articles.dart' ;

String apiKey = '47292931aae4422f85984b97d657002b' ;
String baseUrl = 'https://newsapi.org/v2/top-headlines' ;

class News{
  Future<List<Article>?> getNewsByCategory(String category) async {
    List<Article>? list;
    String url = '$baseUrl?country=id&apiKey=$apiKey&Category=$category' ;
    var response = await http.get(Uri.parse(url)) ;
    if(response.statusCode == 200) {
      var data = jsonDecode(response.body) ;
      var result = data['articles'] as List ;
      list = result.map<Article>((json) => Article.fromJson(json)).toList();
      print(response.body) ;
      return list ;
    } else {
      throw Exception("Error can't acces this web") ;
    }
  }

  Future<List<Article>?> getNews() async {
    List<Article>? list;
    String url = '$baseUrl?country=id&apiKey=$apiKey' ;
    var response = await http.get(Uri.parse(url)) ;
    if(response.statusCode == 200) {
      var data = jsonDecode(response.body) ;
      var result = data['articles'] as List ;
      list = result.map<Article>((json) => Article.fromJson(json)).toList();
      print(response.body) ;
      return list ;
    } else {
      throw Exception("Error can't acces this web") ;
    }
  }
}