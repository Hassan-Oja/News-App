import 'package:flutter/material.dart';
import 'package:news/utils/app_routes.dart';
import 'package:news/utils/app_theme.dart';
import 'package:provider/provider.dart';
import 'Providers/Language_provider.dart';
import 'Providers/theme_provider.dart';
import 'UI/home/home_screen.dart';
import 'l10n/app_localizations.dart';

void main() {
  runApp(
       MultiProvider(
           providers: [
             ChangeNotifierProvider(create: (context) => ThemeProvider()),
             ChangeNotifierProvider(create: (context) => LanguageProvider()),
           ],
           child: MyApp()
       ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    var languageProvider = Provider.of<LanguageProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      initialRoute: AppRoutes.homeRouteName,
      routes: {AppRoutes.homeRouteName: (context) => HomeScreen()},
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeProvider.currentTheme,
      locale: Locale(languageProvider.currentLanguage),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
