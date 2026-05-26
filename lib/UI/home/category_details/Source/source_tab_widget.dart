import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/UI/home/category_details/Source/source_name.dart';
import 'package:news/utils/app_colors.dart';

import '../../../../Model/source_response.dart';

class SourceTabWidget extends StatefulWidget {
  List <Source> sources;

  SourceTabWidget({super.key, required this.sources});

  @override
  State<SourceTabWidget> createState() => _SourceTabWidgetState();
}

class _SourceTabWidgetState extends State<SourceTabWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: widget.sources.length,
        child: Column(
          children: [
            TabBar(
              tabs: widget.sources.map((source) {
                return SourceName(
                    source: source,
                    isSelected: selectedIndex == widget.sources.indexOf(source)
                );
              }).toList(),
              isScrollable: true,
              indicatorColor: Theme.of(context).indicatorColor,
              dividerColor: AppColors.transparent,
              tabAlignment: TabAlignment.start,
              onTap: (index) {
                selectedIndex = index;
                setState(() {

                });
              },
            )
          ],
        )
    );
  }
}
