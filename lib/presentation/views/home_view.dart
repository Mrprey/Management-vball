import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:management_vball/core/constants/borders.dart';
import 'package:management_vball/core/constants/paddings.dart';
import 'package:management_vball/core/constants/sizes.dart';
import 'package:management_vball/core/constants/theme_notifier.dart';
import 'package:management_vball/core/router.gr.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Stack(
        children: [
          _buildMainContent(context),
          Positioned(
            bottom: AppSizes.positionedBottom,
            right: AppSizes.positionedRight,
            child: _buildThemeToggleButton(context),
          ),
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
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.primary,
              foregroundColor: Theme.of(context).colorScheme.onPrimary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppBorders.buttonRadius),
              ),
              padding: AppPaddings.horizontalMedium,
            ),
            child: Text(
              'Go to Player View',
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildThemeToggleButton(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, themeNotifier, child) {
        return IconButton(
          onPressed: () {
            themeNotifier.toggleTheme();
          },
          icon: Icon(
            themeNotifier.isDarkMode ? Icons.dark_mode : Icons.light_mode,
            color: themeNotifier.isDarkMode
                ? Theme.of(context).colorScheme.onSurface
                : Theme.of(context).colorScheme.onSurface,
          ),
        );
      },
    );
  }
}
