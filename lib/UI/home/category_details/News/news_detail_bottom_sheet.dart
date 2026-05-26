import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/Model/news_response.dart';
import 'package:news/l10n/app_localizations.dart';
import '../../../../utils/app_colors.dart';

class NewsDetailBottomSheet extends StatelessWidget {
  News news ;
   NewsDetailBottomSheet({super.key , required this.news});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: width*0.04,vertical: height*0.02),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child:
            CachedNetworkImage(
              imageUrl: news.urlToImage ?? '',
              placeholder: (context, url) => Center(child: CircularProgressIndicator( color: AppColors.grey,)),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          SizedBox(height: 16,),
          Text(
            news.content ?? '',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          SizedBox(height: height*0.005,),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)
                  )
              ),
              onPressed: (){
                // todo : Open The All Article
              },
              child: Text(
                AppLocalizations.of(context)!.view_full_article,
                style: Theme.of(context).textTheme.labelLarge,
              )
          )
        ],
      ),
    );
  }
}
