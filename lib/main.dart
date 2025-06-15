import 'package:flutter/material.dart';
import 'package:volei_project/core/constants/colors.dart';
import 'package:volei_project/core/constants/translations.dart';
import 'package:volei_project/core/di/service_locator.dart';
import 'package:volei_project/presentation/views/player_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Inicializa a injeção de dependências
  setupServiceLocator();

  // Carrega as traduções (padrão: inglês)
  await Translations.load('en');

  runApp(const VoleiApp());
}

class VoleiApp extends StatelessWidget {
  const VoleiApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Volleyball Management',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: AppColors.primary,
        colorScheme: ColorScheme.light(
          primary: AppColors.primary,
          secondary: AppColors.secondary,
        ),
      ),
      home: const PlayerView(), // Usar a view dos jogadores como tela principal
    );
  }
}
