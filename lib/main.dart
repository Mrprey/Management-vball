import 'package:flutter/material.dart';
import 'package:management_vball/core/constants/theme_notifier.dart';
import 'package:management_vball/core/constants/translations.dart';
import 'package:management_vball/core/di/service_locator.dart';
import 'package:management_vball/core/router.gr.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  await Translations.load('en');
  final appRouter = AppRouter();
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeNotifier(),
      child: MyApp(appRouter: appRouter),
    ),
  );
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;

  const MyApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);

    return MaterialApp.router(
      title: 'Management Vball',
      theme: themeNotifier.currentTheme,
      routerDelegate: appRouter.delegate(),
      routeInformationParser: appRouter.defaultRouteParser(),
    );
  }
}
