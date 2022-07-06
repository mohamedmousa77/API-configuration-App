

import 'dart:convert';

import 'package:api/constants/urls.dart';
import 'package:api/modul/article_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../modul/articles_model.dart';

class NewsApi{

  List<Article>articlesList=[];

  Future<List<Article>> fetchArticles() async{

    try{
   http.Response response =await
   http.get(Uri.parse(ApiConstants.newsUrl));
   if(response.statusCode == 200){
     debugPrint('status code  = ' + response.statusCode.toString());
     String data = response.body;
     var jsonData = jsonDecode(data);
     Articles articles = Articles.fromJson(jsonData);
     articlesList = articles.articles.map((e) => Article.fromJson(e)).toList();
     return articlesList;
   }else{
     debugPrint('status code  = ' + response.statusCode.toString() );
   }
  }catch(ex){
      debugPrint(ex.toString());
    }
    return articlesList;
  }

  Future<List<Article>> fetchArticlesByCategory(String category) async{
  try{
    http.Response response =await
    http.get(Uri.parse('https://newsapi.org/v2/top-headlines?country=eg&category=$category&apiKey=c32535bba8a34cdf8ad31aabeeebaad4'));
    if(response.statusCode == 200){
      debugPrint('status code  = ' + response.statusCode.toString());
      String data = response.body;
      var jsonData = jsonDecode(data);
      Articles articles = Articles.fromJson(jsonData);
      articlesList = articles.articles.map((e) => Article.fromJson(e)).toList();
      return articlesList;
    }else{
      debugPrint('status code  = ' + response.statusCode.toString() );
    }
  }catch(ex){
    debugPrint(ex.toString());
  }
  return articlesList;
}

}