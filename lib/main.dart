import 'package:flutter/material.dart';
import 'package:volei_project/app.dart';
import 'package:volei_project/core/constants/translations.dart';
import 'package:volei_project/core/di/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Inicializa a injeção de dependências
  setupServiceLocator();
  
  // Carrega as traduções (padrão: inglês)
  await Translations.load('en');
  
  runApp(const App());
}
