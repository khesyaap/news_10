import 'package:flutter/material.dart';
import 'package:news_10/model/articles.dart';
import 'package:news_10/screen/news_page.dart';
import 'package:news_10/service/data_service.dart';
import 'package:news_10/utils/utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    News news = News() ;
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            image:  const DecorationImage(
                image: NetworkImage(
                    'https://images.unsplash.com/photo-1648138925346-c787f5cc3a81?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
                ))
          ),
          width: 10,
          margin: const EdgeInsets.all(5),
        ),
        title: Text('Good Morning', style: titleArticle.copyWith(
          fontSize: 20
        ),),
        actions: [
          IconButton(
              onPressed:(){} ,
              icon: const Icon(Icons.bookmark, color: Colors.blue,)
          )
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: FutureBuilder(
        future: news.getNews(),
        builder: (context, snapshot) => snapshot.data != null
            ? NewsPage(snapshot.data as List<Article>)
                    : const Center(child: CircularProgressIndicator(),)
      )
    );
  }
}
