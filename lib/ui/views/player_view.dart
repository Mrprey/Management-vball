import 'package:flutter/material.dart';

import '../../adapters/controllers/player_controller.dart';
import '../../application/use_cases/player_registry.dart';
import '../../constants/colors.dart';
import '../../constants/sizes.dart';
import '../../constants/translations.dart';

class PlayerView extends StatefulWidget {
  const PlayerView({super.key});

  @override
  _PlayerViewState createState() => _PlayerViewState();
}

class _PlayerViewState extends State<PlayerView> {
  final _nameController = TextEditingController();
  final _numberController = TextEditingController();
  final _roleController = TextEditingController();

  final _controller = PlayerController(PlayerRegistry());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Translations.of(context).playerRegistration),
        backgroundColor: AppColors.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppSizes.medium),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: Translations.of(context).name),
            ),
            TextField(
              controller: _numberController,
              decoration: InputDecoration(labelText: Translations.of(context).number),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _roleController,
              decoration: InputDecoration(labelText: Translations.of(context).role),
            ),
            const SizedBox(height: AppSizes.medium),
            ElevatedButton(
              onPressed: () {
                final name = _nameController.text;
                final number = int.tryParse(_numberController.text) ?? 0;
                final role = _roleController.text;

                _controller.addPlayer(name, number, role);

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(Translations.of(context).playerRegistered),
                  ),
                );

                _nameController.clear();
                _numberController.clear();
                _roleController.clear();
              },
              child: Text(Translations.of(context).register),
            ),
          ],
        ),
      ),
    );
  }
}
