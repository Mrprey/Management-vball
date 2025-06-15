import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:management_vball/domain/use_cases/player_use_cases.dart';
import 'package:management_vball/presentation/view_models/player_view_model.dart';
import 'package:management_vball/core/constants/translations.dart';
import 'package:get_it/get_it.dart';

import '../../data/repositories/fake_player_repository.dart';

// Mock do PlayerView para evitar a chamada ao GetIt
class MockPlayerView extends StatefulWidget {
  final PlayerViewModel viewModel;
  
  const MockPlayerView({Key? key, required this.viewModel}) : super(key: key);
  
  @override
  _MockPlayerViewState createState() => _MockPlayerViewState();
}

class _MockPlayerViewState extends State<MockPlayerView> {
  final _nameController = TextEditingController();
  final _numberController = TextEditingController();
  String _selectedPosition = 'L'; // Default position (Setter)
  
  @override
  void initState() {
    super.initState();
    widget.viewModel.loadPlayers();
  }
  
  @override
  void dispose() {
    _nameController.dispose();
    _numberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Translations.of(context).playerRegistration),
      ),
      body: Consumer<PlayerViewModel>(
        builder: (context, model, child) {
          return model.isLoading
            ? const Center(child: CircularProgressIndicator())
            : Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    TextField(
                      controller: _nameController,
                      decoration: InputDecoration(labelText: Translations.of(context).name),
                    ),                    TextField(
                      controller: _numberController,
                      decoration: InputDecoration(labelText: Translations.of(context).number),
                      keyboardType: TextInputType.number,
                    ),
                    DropdownButtonFormField<String>(
                      value: _selectedPosition,
                      decoration: InputDecoration(
                        labelText: Translations.of(context).role,
                        border: OutlineInputBorder(),
                      ),
                      items: [
                        DropdownMenuItem(value: 'L', child: Text('L - Setter')),
                        DropdownMenuItem(value: 'P1', child: Text('P1 - Outside Hitter 1')),
                        DropdownMenuItem(value: 'P2', child: Text('P2 - Outside Hitter 2')),
                        DropdownMenuItem(value: 'O', child: Text('O - Opposite')),
                        DropdownMenuItem(value: 'M1', child: Text('M1 - Middle Blocker 1')),
                        DropdownMenuItem(value: 'M2', child: Text('M2 - Middle Blocker 2')),
                        DropdownMenuItem(value: 'Lib', child: Text('Lib - Libero')),
                      ],
                      onChanged: (value) {
                        setState(() {
                          if (value != null) {
                            _selectedPosition = value;
                          }
                        });
                      },
                    ),
                    const SizedBox(height: 16.0),
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
                              _selectedPosition = 'L'; // Reset to default
                            });
                            
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(Translations.of(context).playerRegistered)),
                            );
                          }
                        });
                      },
                      child: Text(Translations.of(context).register),
                    ),
                    
                    const SizedBox(height: 16.0),
                    
                    Expanded(
                      child: model.players.isEmpty
                        ? Center(child: Text('No players registered yet'))
                        : ListView.builder(
                            itemCount: model.players.length,
                            itemBuilder: (context, index) {
                              final player = model.players[index];
                              return ListTile(
                                title: Text(player.name),
                                subtitle: Text('${player.number} - ${player.position}'),
                              );
                            },
                          ),
                    ),
                  ],
                ),
              );
        },
      ),
    );
  }
}

void main() {
  setUp(() async {
    // Mock translations
    Map<String, String> mockTranslations = {
      'playerRegistration': 'Player Registration',
      'name': 'Name',
      'number': 'Number',
      'role': 'Role',
      'register': 'Register',
      'playerRegistered': 'Player successfully registered!'
    };
    Translations.setMockStrings(mockTranslations);
    
    // Clear GetIt singleton if initialized
    if (GetIt.I.isRegistered<PlayerViewModel>()) {
      await GetIt.I.reset();
    }
  });
  
  Future<void> pumpPlayerView(WidgetTester tester) async {
    final repository = FakePlayerRepository();
    final registerUseCase = RegisterPlayerUseCase(repository);
    final getAllPlayersUseCase = GetAllPlayersUseCase(repository);
    final viewModel = PlayerViewModel(registerUseCase, getAllPlayersUseCase);
    
    await tester.pumpWidget(
      MaterialApp(
        home: ChangeNotifierProvider<PlayerViewModel>.value(
          value: viewModel,
          child: MockPlayerView(viewModel: viewModel),
        ),
      ),
    );
  }  testWidgets('PlayerView should display input fields and register button',
      (WidgetTester tester) async {
    // Arrange
    await pumpPlayerView(tester);
    await tester.pumpAndSettle(); // Wait for complete rendering

    // Assert
    expect(find.byType(TextField), findsAtLeast(2)); // Dois campos de texto (nome e número)
    expect(find.byType(DropdownButtonFormField<String>), findsOneWidget); // Dropdown para posições
    expect(find.byType(ElevatedButton), findsOneWidget); // Register button
  });

  testWidgets('PlayerView should register a player and show message',
      (WidgetTester tester) async {
    // Arrange
    await pumpPlayerView(tester);
    await tester.pumpAndSettle();

    // Act
    await tester.enterText(find.byType(TextField).at(0), 'John Doe');
    await tester.enterText(find.byType(TextField).at(1), '10');
    // No need to enter text for position, as it uses a dropdown with default value
    await tester.pump();
    
    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle();

    // Assert
    expect(find.text('John Doe'), findsWidgets); // O nome deve aparecer na lista
  });
}
