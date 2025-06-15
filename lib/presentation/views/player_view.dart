import 'package:flutter/material.dart';
import 'package:management_vball/core/constants/player_positions.dart';
import 'package:management_vball/core/constants/sizes.dart';
import 'package:management_vball/core/constants/translations.dart';
import 'package:management_vball/core/di/service_locator.dart';
import 'package:management_vball/presentation/view_models/player_view_model.dart';
import 'package:provider/provider.dart';

class PlayerView extends StatefulWidget {
  const PlayerView({super.key});

  @override
  _PlayerViewState createState() => _PlayerViewState();
}

class _PlayerViewState extends State<PlayerView> {
  final _nameController = TextEditingController();
  final _numberController = TextEditingController();
  String _selectedPosition = PlayerPositions.setter; // Default position

  late final PlayerViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = getIt<PlayerViewModel>();
    _viewModel.loadPlayers();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _numberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _viewModel,
      child: Consumer<PlayerViewModel>(
        builder: (context, model, child) {
          if (model.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return _buildContent(context, model);
        },
      ),
    );
  }

  Widget _buildContent(BuildContext context, PlayerViewModel model) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Translations.of(context).playerRegistration),
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppSizes.medium),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration:
                  InputDecoration(labelText: Translations.of(context).name),
            ),
            TextField(
              controller: _numberController,
              decoration:
                  InputDecoration(labelText: Translations.of(context).number),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: AppSizes.small),
            DropdownButtonFormField<String>(
              value: _selectedPosition,
              decoration: InputDecoration(
                labelText: Translations.of(context).role,
                border: const OutlineInputBorder(),
              ),
              items: PlayerPositions.getPositionItems(),
              onChanged: (value) {
                setState(() {
                  if (value != null) {
                    _selectedPosition = value;
                  }
                });
              },
            ),
            const SizedBox(height: AppSizes.medium),
            if (model.errorMessage != null)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  model.errorMessage!,
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            ElevatedButton(
              onPressed: () {
                final name = _nameController.text;
                final number = int.tryParse(_numberController.text) ?? 0;
                final role = _selectedPosition;

                model.addPlayer(name, number, role).then((_) {
                  if (model.errorMessage == null) {
                    _nameController.clear();
                    _numberController.clear();
                    setState(() {
                      _selectedPosition =
                          PlayerPositions.setter; // Reset to default
                    });

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content:
                              Text(Translations.of(context).playerRegistered)),
                    );
                  }
                });
              },
              child: Text(Translations.of(context).register),
            ),
            const SizedBox(height: AppSizes.medium),
            Expanded(
              child: model.players.isEmpty
                  ? const Center(child: Text('No players registered yet'))
                  : ListView.builder(
                      itemCount: model.players.length,
                      itemBuilder: (context, index) {
                        final player = model.players[index];
                        return ListTile(
                          title: Text(player.name),
                          subtitle:
                              Text('${player.number} - ${player.position}'),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
