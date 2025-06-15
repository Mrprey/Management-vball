import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_models/rotation_manager_view_model.dart';

class RotationManagerView extends StatelessWidget {
  const RotationManagerView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RotationManagerViewModel(),
      child: Consumer<RotationManagerViewModel>(
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                  viewModel.isReceptionMode ? 'Reception Mode' : 'Serve Mode'),
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    'Current Position: ${viewModel.currentPosition}',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child:
                        CourtWidget(positions: viewModel.getPositions(context)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: viewModel.rotatePlayers,
                        child: const Text('Rotate Players'),
                      ),
                      ElevatedButton(
                        onPressed: viewModel.toggleMode,
                        child: Text(viewModel.isReceptionMode
                            ? 'Switch to Serve Mode'
                            : 'Switch to Reception Mode'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class CourtWidget extends StatelessWidget {
  final List<Map<String, dynamic>> positions;

  const CourtWidget({super.key, required this.positions});

  @override
  Widget build(BuildContext context) {
    if (positions.isEmpty) {
      debugPrint('No positions available to display on the court.');
      return Center(
        child: Text(
          'No player positions available.',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      );
    }

    return AspectRatio(
      aspectRatio: 0.6,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(),
        ),
        child: Stack(
          children: [
            const Positioned(
              top: 100,
              left: 0,
              right: 0,
              child: Divider(
                color: Colors.black,
                thickness: 2,
              ),
            ),
            ...positions.map((pos) => Positioned(
                  top: pos['top'],
                  left: pos['left'],
                  child: PlayerCircle(playerName: pos['name']),
                )),
          ],
        ),
      ),
    );
  }
}

class PlayerCircle extends StatelessWidget {
  final String playerName;

  const PlayerCircle({super.key, required this.playerName});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          child: Text(playerName),
        ),
        const SizedBox(height: 4),
        Text(playerName),
      ],
    );
  }
}
