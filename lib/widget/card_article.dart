import 'package:flutter/material.dart';
import 'package:initial_project/data/model/articles.dart';
import 'package:initial_project/ui/article_detail_page.dart';

class CardArticle extends StatelessWidget {
  final Article article;

  const CardArticle({
    required this.article
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 8.0,
        ),
        leading: Hero(
          tag: '${article.publishedAt}',
          child: Image.asset(
            'assets/images/cnn.jpeg',
            width: 100,
          ),
        ),
        title: Text(
          "${article.title}",
        ),
        subtitle: Text(
          article.author,
        ), 
        onTap: () => Navigator.pushNamed(
          context,
          ArticleDetailPage.routeName,
          arguments: article,
        ),
      ),
    );
  }
}