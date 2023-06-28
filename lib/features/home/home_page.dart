import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_scaffold/app_themes.dart';
import 'package:get/get.dart';

class ScaffoldHomePage extends StatefulWidget {
  const ScaffoldHomePage({super.key, required this.title});

  final String title;

  @override
  State<ScaffoldHomePage> createState() => _ScaffoldHomePageState();
}

class _ScaffoldHomePageState extends State<ScaffoldHomePage> {
  void _showBottomSheet() {
    Get.bottomSheet(Wrap(
      children: [
        ListTile(
          leading: const Icon(Icons.wb_sunny_outlined),
          title: Text(AppLocalizations.of(context)!.lightMode),
          onTap: () {
            Get.changeTheme(AppThemes.lightTheme);
            Get.back();
          },
        ),
        ListTile(
          leading: const Icon(Icons.wb_sunny),
          title: Text(AppLocalizations.of(context)!.darkMode),
          onTap: () {
            Get.changeTheme(AppThemes.darkTheme);
            Get.back();
          },
        )
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Hello Word',
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showBottomSheet,
        tooltip: 'settings',
        child: const Icon(Icons.settings),
      ),
    );
  }
}
