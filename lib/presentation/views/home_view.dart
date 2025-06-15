import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:management_vball/core/constants/colors.dart';
import 'package:management_vball/core/constants/theme_notifier.dart';
import 'package:management_vball/core/router.gr.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Stack(
        children: [
          _buildMainContent(context),
          _buildThemeToggleButton(context),
        ],
      ),
    );
  }

  Widget _buildMainContent(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              context.router.push(const PlayerView());
            },
            child: const Text('Go to Player View'),
          ),
        ],
      ),
    );
  }

  Widget _buildThemeToggleButton(BuildContext context) {
    return Positioned(
      bottom: 20,
      right: 20,
      child: Consumer<ThemeNotifier>(
        builder: (context, themeNotifier, child) {
          return IconButton(
            onPressed: () {
              themeNotifier.toggleTheme();
            },
            icon: Icon(
              themeNotifier.isDarkMode
                  ? Icons.dark_mode
                  : Icons.light_mode,
              color: themeNotifier.isDarkMode
                  ? AppColors.primaryDark
                  : AppColors.primary,
            ),
          );
        },
      ),
    );
  }
}
