import 'package:flutter/material.dart';
import 'package:management_vball/core/constants/themes.dart';
import 'package:management_vball/presentation/views/player_view.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Volleyball Management',
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      home: const PlayerView(),
    );
  }
}
