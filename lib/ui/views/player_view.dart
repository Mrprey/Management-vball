import 'package:flutter/material.dart';
import '../../adapters/controllers/player_controller.dart';
import '../../application/use_cases/register_player.dart';
import '../../domain/entities/player.dart';

class PlayerRegistry {
  final List<Player> _players = [];

  Player addPlayer(String name, int number, String role) {
    final newPlayer = Player(name: name, number: number, position: role);
    _players.add(newPlayer);
    return newPlayer;
  }

  List<Player> listPlayers() {
    return _players;
  }
}

class PlayerView extends StatefulWidget {
  const PlayerView({Key? key}) : super(key: key);

  @override
  _PlayerViewState createState() => _PlayerViewState();
}

class _PlayerViewState extends State<PlayerView> {
  final _nameController = TextEditingController();
  final _numberController = TextEditingController();
  final _roleController = TextEditingController();

  final _controller = PlayerController(RegisterPlayer());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Player Registration'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
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
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final name = _nameController.text;
                final number = int.tryParse(_numberController.text) ?? 0;
                final role = _roleController.text;

                _controller.addPlayer(name, number, role);

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Player successfully registered!')),
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
