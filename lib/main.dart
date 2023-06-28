import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_scaffold/app_themes.dart';
import 'package:flutter_scaffold/features/home/home_page.dart';
import 'package:flutter_scaffold/utils/constants.dart';
import 'package:get/get.dart';

void main() {
  runApp(const ScaffoldApp());
}

class ScaffoldApp extends StatelessWidget {
  const ScaffoldApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: Constants.appTitle,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('zh'),
      ],
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      home: const ScaffoldHomePage(title: Constants.appTitle),
    );
  }
}
