import 'package:ark_flutter/app_themes.dart';
import 'package:authentication/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

const routeHome = '/';
const routeSettings = '/settings';
const authentication = '/authentication';

void main() {
  runApp(
    GetMaterialApp(
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
      initialRoute: routeHome,
      // 设置初始路由
      getPages: [
        GetPage(name: routeHome, page: () => const HomeScreen()),
        GetPage(name: routeSettings, page: () => const SettingsScreen()),
        GetPage(
            name: authentication,
            page: () => const AuthenticationScreen(
                  title: ' Authentication',
                )),
      ],
      debugShowCheckedModeBanner: false,
    ),
  );
}

@immutable
class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 250,
                height: 250,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Icon(
                    Icons.lightbulb,
                    size: 175,
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                ),
              ),
              const SizedBox(height: 32),
              const Text(
                'Hello world',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(authentication);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text('Welcome'),
      actions: [
        IconButton(
          icon: const Icon(Icons.settings),
          onPressed: () {
            Get.toNamed(routeSettings);
          },
        ),
      ],
    );
  }
}

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({
    Key? key,
  }) : super(key: key);

  void _showBottomSheet(BuildContext context) {
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
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Container(
            width: double.infinity,
            height: 54,
            margin: const EdgeInsets.only(left: 16, right: 16, top: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            child: TextButton(
              onPressed: () {
                _showBottomSheet(context);
              },
              child: const Text(
                'Theme',
              ),
            ),
          )
        ]),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: const Text('Settings'),
    );
  }
}
