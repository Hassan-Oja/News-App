import 'package:flutter/material.dart';
import 'package:news/Model/source_response.dart';
import 'package:news/UI/home/category_details/News/news_item.dart';
import '../../../../API/api_manager.dart';
import '../../../../Model/news_response.dart';

class NewsWidget extends StatelessWidget {
  Source source;

  NewsWidget({super.key, required this.source});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsResponse?>(
      future: ApiManager.getNews(source.id ?? ""),
      builder: (context, snapshot) {
        // loading
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator(
            color: Theme
                .of(context)
                .indicatorColor,
          ));
        }
        // error => client
        else if (snapshot.hasError) {
          return Column(
            children: [
              Text(
                "SomeThing Went Wrong",
                style: Theme
                    .of(context)
                    .textTheme
                    .labelLarge,
              ),
              ElevatedButton(
                  onPressed: () {
                    ApiManager.getNews(source.id ?? "");
                  },
                  child: Text(
                    "Try Again",
                    style: Theme
                        .of(context)
                        .textTheme
                        .labelLarge,

                  )
              )
            ],
          );
        }

        // server => response (success or error )
        // server => error
        if (snapshot.data?.status != "ok") {
          return Column(
            children: [
              Text(
                snapshot.data!.message!,
                style: Theme
                    .of(context)
                    .textTheme
                    .labelLarge,
              ),
              ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "Try Again",
                    style: Theme
                        .of(context)
                        .textTheme
                        .labelLarge,

                  )
              )

            ],
          );
        }
        // server => success
        var newsList = snapshot.data!.articles ?? [];
        return ListView.builder(
            itemBuilder: (context, index) {
              return NewsItem(
                news: newsList[index],
              );
            },
            itemCount: newsList.length
        );
      },
    );
  }
}
