import 'package:flutter/material.dart';
import 'package:news/UI/home/category_details/category_details.dart';
import 'package:news/l10n/app_localizations.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
         AppLocalizations.of(context)!.home,
          style: Theme.of(context).textTheme.labelLarge,
          ),
        centerTitle: true,
      ),
      body: CategoryDetails(),

    );
  }
}
