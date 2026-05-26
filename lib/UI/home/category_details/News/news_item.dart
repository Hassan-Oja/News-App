import 'package:flutter/material.dart';

import '../../../../Model/news_response.dart';

class NewsItem extends StatelessWidget {
  News news;
   NewsItem({super.key , required this.news });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: width*0.04,
          vertical: height*0.02
      ),
      padding: EdgeInsets.symmetric(
          horizontal: width*0.02,
          vertical: height*0.02
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
              color: Theme.of(context).indicatorColor,
              width: 2
          )
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(news.urlToImage??"")
            // CachedNetworkImage(
            //   imageUrl: news.urlToImage ?? '',
            //   placeholder: (context, url) => Center(child: CircularProgressIndicator( color: AppColors.grey,)),
            //   errorWidget: (context, url, error) => Icon(Icons.error),
            // ),
          ),
          SizedBox(height: height*0.02,),
          Text(
            news.title ?? '',
            style: Theme.of(context).textTheme.labelLarge,
          ),
          SizedBox(height: height*0.02,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  'By ${news.author ?? ''}',
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ),
              Text(
                news.publishedAt ?? '',
                style: Theme.of(context).textTheme.labelSmall,
              )
            ],
          )
        ],
      ),
    );
  }
}
