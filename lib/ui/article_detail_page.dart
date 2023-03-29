import 'package:flutter/material.dart';
import 'package:initial_project/data/model/articles.dart';
import 'package:initial_project/ui/article_web_view.dart';

class ArticleDetailPage extends StatelessWidget {
  static const routeName = '/article_detail';
  final Article article;
  const ArticleDetailPage(
    this.article
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News App'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Hero(
              tag: '${article.publishedAt}${article.author}',
              child: Image.asset(
                '/assets/images/cnn.jpeg',
              )
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Berita Terbaru',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  Divider(
                    color: Colors.grey,
                  ),
                  Text(
                    '${article.title}',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Text(
                    'Date: ${article.publishedAt}',
                    style: Theme.of(context).textTheme.caption,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Author: ${article.author}',
                    style: Theme.of(context).textTheme.caption,
                  ),
                  Divider(
                    color: Colors.grey,
                  ),
                  Text(
                    article.content ?? "",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(onPressed: () {
                    Navigator.pushNamed(context, ArticleWebView.routeName, arguments: article.url);
                  }, child: Text('Read More')),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}