import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:management_vball/core/router.gr.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
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
      ),
    );
  }
}
