import 'package:flutter/material.dart';
import 'package:management_vball/core/constants/borders.dart';
import 'package:management_vball/core/constants/paddings.dart';
import 'package:management_vball/core/constants/player_positions.dart';
import 'package:management_vball/core/constants/sizes.dart';
import 'package:management_vball/core/constants/translations.dart';
import 'package:management_vball/core/di/service_locator.dart';
import 'package:management_vball/presentation/view_models/player_view_model.dart';
import 'package:management_vball/presentation/widgets/snackbar_widget.dart';
import 'package:provider/provider.dart';

class PlayerView extends StatefulWidget {
  const PlayerView({super.key});

  @override
  PlayerViewState createState() => PlayerViewState();
}

class PlayerViewState extends State<PlayerView> {
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
    final BuildContext currentContext = context;
    return ChangeNotifierProvider.value(
      value: _viewModel,
      child: Consumer<PlayerViewModel>(
        builder: (context, model, child) {
          if (model.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return _buildContent(currentContext, model);
        },
      ),
    );
  }

  Widget _buildContent(BuildContext context, PlayerViewModel model) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Translations.of(context).playerRegistration,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Padding(
        padding: AppPaddings.medium,
        child: Column(
          children: [
            _buildForm(context, model),
            const SizedBox(height: AppSizes.medium),
            if (model.errorMessage != null)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  model.errorMessage!,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.error,
                    fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
                  ),
                ),
              ),
            ElevatedButton(
              onPressed: () async {
                final name = _nameController.text;
                final number = int.tryParse(_numberController.text) ?? 0;
                final role = _selectedPosition;

                await model.addPlayer(name, number, role);

                if (model.errorMessage == null) {
                  _nameController.clear();
                  _numberController.clear();
                  setState(() {
                    _selectedPosition = PlayerPositions.setter;
                  });

                  final String message =
                      Translations.of(context).playerRegistered;
                  final Color backgroundColor =
                      Theme.of(context).colorScheme.surface;
                  final TextStyle? textStyle =
                      Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).colorScheme.onSurface,
                          );

                  if (!mounted) return;

                  SnackbarWidget.show(
                      context, message, backgroundColor, textStyle);
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
                foregroundColor: Theme.of(context).colorScheme.onPrimary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppBorders.buttonRadius),
                ),
                padding: AppPaddings.small,
              ),
              child: Text(
                Translations.of(context).register,
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ),
            const SizedBox(height: AppSizes.medium),
            Expanded(
              child: _buildPlayerList(model),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildForm(BuildContext context, PlayerViewModel model) {
    return Column(
      children: [
        TextField(
          controller: _nameController,
          decoration: InputDecoration(
            labelText: Translations.of(context).name,
            labelStyle: Theme.of(context).textTheme.bodyMedium,
            border: const OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: AppSizes.small),
        TextField(
          controller: _numberController,
          decoration: InputDecoration(
            labelText: Translations.of(context).number,
            labelStyle: Theme.of(context).textTheme.bodyMedium,
            border: const OutlineInputBorder(),
          ),
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: AppSizes.small),
        DropdownButtonFormField<String>(
          value: _selectedPosition,
          decoration: InputDecoration(
            labelText: Translations.of(context).role,
            labelStyle: Theme.of(context).textTheme.bodyMedium,
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
      ],
    );
  }

  Widget _buildPlayerList(PlayerViewModel model) {
    return model.players.isEmpty
        ? Center(
            child: Text(
              'No players registered yet',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          )
        : ListView.builder(
            itemCount: model.players.length,
            itemBuilder: (context, index) {
              final player = model.players[index];
              return ListTile(
                title: Text(
                  player.name,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                subtitle: Text(
                  '${player.number} - ${player.position}',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              );
            },
          );
  }
}
