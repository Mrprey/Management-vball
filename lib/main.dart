import 'package:flutter/material.dart';

void main() {
  runApp(const VoleiApp());
}

class VoleiApp extends StatelessWidget {
  const VoleiApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gerenciamento de Vôlei',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gerenciamento de Vôlei'),
      ),
      body: const Center(
        child: Text('Bem-vindo ao Gerenciamento de Vôlei!'),
      ),
    );
  }
}
