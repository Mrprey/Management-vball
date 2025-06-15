import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:management_vball/core/constants/translations.dart';
import 'package:management_vball/domain/use_cases/player_use_cases.dart';
import 'package:management_vball/presentation/view_models/player_view_model.dart';
import 'package:provider/provider.dart';

import '../../data/repositories/fake_player_repository.dart';

class MockPlayerView extends StatelessWidget {
  final PlayerViewModel viewModel;

  const MockPlayerView({super.key, required this.viewModel});

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
              : const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text('Mocked Player View'),
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
    Map<String, String> mockTranslations = {
      'playerRegistration': 'Player Registration',
      'name': 'Name',
      'number': 'Number',
      'role': 'Role',
      'register': 'Register',
      'playerRegistered': 'Player successfully registered!'
    };
    Translations.setMockStrings(mockTranslations);

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
  }

  testWidgets('PlayerView should display input fields and register button',
      (WidgetTester tester) async {
    await pumpPlayerView(tester);
    await tester.pumpAndSettle();

    expect(find.byType(TextField), findsAtLeast(2));
    expect(find.byType(DropdownButtonFormField<String>), findsOneWidget);
    expect(find.byType(ElevatedButton), findsOneWidget);
  });

  testWidgets('PlayerView should register a player and show message',
      (WidgetTester tester) async {
    await pumpPlayerView(tester);
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextField).at(0), 'John Doe');
    await tester.enterText(find.byType(TextField).at(1), '10');
    await tester.pump();

    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle();

    expect(find.text('John Doe'), findsWidgets);
  });
}
