import 'package:flutter/material.dart';

import '../../adapters/controllers/player_controller.dart';
import '../../application/use_cases/player_registry.dart';
import '../../constants/colors.dart';
import '../../constants/sizes.dart';

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
        title: const Text('Player Registration'),
        backgroundColor: AppColors.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppSizes.medium),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _numberController,
              decoration: const InputDecoration(labelText: 'Number'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _roleController,
              decoration: const InputDecoration(labelText: 'Role'),
            ),
            const SizedBox(height: AppSizes.medium),
            ElevatedButton(
              onPressed: () {
                final name = _nameController.text;
                final number = int.tryParse(_numberController.text) ?? 0;
                final role = _roleController.text;

                _controller.addPlayer(name, number, role);

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Player successfully registered!'),
                  ),
                );

                _nameController.clear();
                _numberController.clear();
                _roleController.clear();
              },
              child: const Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
