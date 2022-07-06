
import 'package:api/modul/article_model.dart';
import 'package:api/services/news_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArticleController extends GetxController{

  List<Article> _articlesList = [];

  fetchArticle()async{
    _articlesList =await NewsApi().fetchArticles();
    debugPrint('fetchArticle called !!1');
    update();
  }

  List<Article> get articles => _articlesList;

}