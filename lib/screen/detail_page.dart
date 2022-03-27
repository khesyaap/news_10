import 'package:flutter/material.dart';
import 'package:news_10/model/articles.dart';
import 'package:news_10/utils/utils.dart';
import 'package:timeago/timeago.dart' as timeago;

class DetailPage extends StatelessWidget {

  final Article article;
  DetailPage(this.article);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Image.network(article.urlToImage.toString(),
              height: 350,
            fit: BoxFit.cover,
            ),
            ListView(
              children: [
                SizedBox(height: 330,),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                    color: Colors.white
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        //ini untuk title
                        Text(
                          article.title.toString(),
                          style: titleArticle.copyWith(
                            fontSize: 20
                          ),),
                      SizedBox(height: 20,),
                      //  ini untuk icon date dan author
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //untuk author
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(Icons.account_circle, size: 24,),
                                SizedBox(width: 10,),
                                Text(article.author.toString(),
                                  style: authorDateArticle.copyWith(
                                    fontSize: 14
                                  ),
                                )
                              ],
                            ),
                            //untuk date
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(Icons.calendar_today, size: 24,),
                                SizedBox(width: 10,),
                                Text(
                                  timeUntil(DateTime.parse(article.publishedAt.toString())),
                                  style: authorDateArticle.copyWith(
                                      fontSize: 14
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                        SizedBox(height: 20,),
                        Text(article.content.toString(), textAlign: TextAlign.left, style: detailArticle.copyWith(
                          fontSize: 16
                        ),)
                      ],
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 30
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          offset: const Offset(0, 10),
                          blurRadius: 50
                        )
                      ]
                    ),
                    child: IconButton(
                      onPressed:() {
                        Navigator.pop(context);
                      },
                      icon: const Padding(
                          padding: EdgeInsets.only(left: 4),
                          child: Icon(Icons.arrow_back_ios),
                      )),
                  ),
                  Container(
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          offset: const Offset(0, 10),
                          blurRadius: 50
                        )
                      ]
                    ),
                    child: IconButton(
                      onPressed:() {

                      },
                      icon: Icon(Icons.bookmark_border_rounded)),
                  ),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  String timeUntil(DateTime parse){
    return timeago.format(parse, allowFromNow: true, locale: 'en');
  }
}
