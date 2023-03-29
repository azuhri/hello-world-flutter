import 'package:flutter/material.dart';
import 'package:initial_project/data/model/articles.dart';
import 'package:initial_project/ui/article_detail_page.dart';
import 'package:initial_project/ui/article_list_page.dart';
import 'package:initial_project/ui/article_web_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Demo",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/':(context) => ArticleListPage(),
        '/article_web' : (context) =>
            ArticleWebView(
              url : ModalRoute.of(context)?.settings.arguments as String
            ),
        '/article_detail': (context) => 
            ArticleDetailPage(
              ModalRoute.of(context)?.settings.arguments as Article
            )
      },
    );
  }
}

