import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:news_10/model/articles.dart';
import 'package:news_10/service/data_service.dart';
import 'package:news_10/widget/news_item.dart';

class TabMenu extends StatefulWidget {
  //buat constructor / param untuk mengambil data dari model
  final List<Article> article;
  TabMenu(this.article);

  @override
  _TabMenuState createState() => _TabMenuState();
}

class _TabMenuState extends State<TabMenu> with SingleTickerProviderStateMixin {

  late TabController _tabController;
  final List<Tab> myTabs = <Tab> [
    // berisi judul tab2 kita
    // business
    // entertainment
    // general
    // health
    // science
    // sports
    // technology
    const Tab(
      text: 'Business' ,
    ),
    const Tab(
      text: 'Entertainment' ,
    ),
    const Tab(
      text: 'General' ,
    ),
    const Tab(
      text: 'Health' ,
    ),
    const Tab(
      text: 'Science' ,
    ),
    const Tab(
      text: 'Sports' ,
    ),
    const Tab(
      text: 'Technology' ,
    ),
  ];

  @override
  void initState() {
    // TODO: implement initState
    _tabController = TabController(length: myTabs.length, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //buat var news untuk koneksi ke server by categori di kelas news
    News news = News();
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          TabBar(
            controller: _tabController,
              labelColor: Colors.deepOrangeAccent,
              unselectedLabelColor: Colors.black,
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: const BubbleTabIndicator(
                indicatorHeight: 30.0,
                indicatorColor: Colors.black,
                tabBarIndicatorSize: TabBarIndicatorSize.tab
              ),
              tabs: myTabs,
            isScrollable: true,
          ),
          SizedBox(height: 10,),
          Expanded(
              child: TabBarView(
                controller: _tabController,
                  children: myTabs.map((Tab tab) {
                    return FutureBuilder(
                      future: news.getNewsByCategory(tab.text.toString()),
                        builder: (context, snapshot) => snapshot.data !=null
                            ? _listNewsByCategory(snapshot.data as List<Article>)
                            : const Center(child: CircularProgressIndicator())
                    );
                  }).toList(),
              )
          )
        ],
      ),
    );
  }

  Widget _listNewsByCategory(List<Article> article) {
    return Container(
      height: MediaQuery.of(context).size.height,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: ListView.builder(
          itemBuilder: (context, index) =>  NewsItem(article[index]),
        itemCount: article.length,
      ),
    );
  }
}
