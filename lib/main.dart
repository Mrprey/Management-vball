import 'package:flutter/material.dart';
import 'package:volei_project/app.dart';
import 'package:volei_project/core/constants/translations.dart';
import 'package:volei_project/core/di/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize dependency injection
  setupServiceLocator();

  // Load translations (default: English)
  await Translations.load('en');

  runApp(const App());
}
