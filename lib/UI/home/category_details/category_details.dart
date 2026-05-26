import 'package:flutter/material.dart';
import 'package:news/API/api_manager.dart';
import 'package:news/Model/source_response.dart';
import 'package:news/UI/home/category_details/Source/source_tab_widget.dart';

class CategoryDetails extends StatefulWidget {
  const CategoryDetails({super.key});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourceResponse?>(
      future: ApiManager.getSources(),
      builder: (context, snapshot) {
        // loading
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }else if(snapshot.hasError){
          // error => client
          return Column(
            children: [
              Text(
                  "SomeThing Went Wrong",
                style: Theme.of(context).textTheme.labelLarge,
              ),
              ElevatedButton(
                  onPressed: (){

                  },
                  child: Text(
                    "Try Again",
                      style: Theme.of(context).textTheme.labelLarge,

                  )
              )

            ],
          );
        }

        // server => error
        if(snapshot.data?.status != "ok"){
          return  Column(
            children: [
              Text(
                snapshot.data!.message!,
                style: Theme.of(context).textTheme.labelLarge,
              ),
              ElevatedButton(
                  onPressed: (){},
                  child: Text(
                    "Try Again",
                    style: Theme.of(context).textTheme.labelLarge,

                  )
              )

            ],
          );
        }

        var sourceList = snapshot.data!.sources ?? [];
        return SourceTabWidget(sources: sourceList);


      },
    );
  }
}
