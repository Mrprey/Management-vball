import 'package:flutter/material.dart';
import 'package:volei_project/core/constants/themes.dart';
import 'package:volei_project/presentation/views/player_view.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Volleyball Management',
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: ThemeMode.system, // Usar o tema do sistema
      home: const PlayerView(),
    );
  }
}
