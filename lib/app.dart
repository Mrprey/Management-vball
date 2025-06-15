import 'package:flutter/material.dart';
import 'package:volei_project/core/constants/colors.dart';
import 'package:volei_project/presentation/views/player_view.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Volleyball Management',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: AppColors.primary,
        colorScheme: const ColorScheme.light(
          primary: AppColors.primary,
          secondary: AppColors.secondary,
        ),
      ),
      home: const PlayerView(),
    );
  }
}
