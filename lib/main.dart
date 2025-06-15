import 'package:flutter/material.dart';
import 'package:management_vball/app.dart';
import 'package:management_vball/core/constants/translations.dart';
import 'package:management_vball/core/di/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize dependency injection
  setupServiceLocator();

  // Load translations (default: English)
  await Translations.load('en');

  runApp(const App());
}
