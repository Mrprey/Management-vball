import 'package:get_it/get_it.dart';
import 'package:management_vball/data/repositories/player_repository_impl.dart';
import 'package:management_vball/domain/repositories/player_repository.dart';
import 'package:management_vball/domain/use_cases/player_use_cases.dart';
import 'package:management_vball/presentation/view_models/player_view_model.dart';

final GetIt getIt = GetIt.instance;

void setupServiceLocator() {  // Repositories
  getIt.registerLazySingleton<PlayerRepository>(
    () => PlayerRepositoryImpl(),
  );

  // Use Cases
  getIt.registerFactory<RegisterPlayerUseCase>(
    () => RegisterPlayerUseCase(getIt<PlayerRepository>()),
  );

  getIt.registerFactory<GetAllPlayersUseCase>(
    () => GetAllPlayersUseCase(getIt<PlayerRepository>()),
  );

  // ViewModels
  getIt.registerFactory<PlayerViewModel>(
    () => PlayerViewModel(
      getIt<RegisterPlayerUseCase>(),
      getIt<GetAllPlayersUseCase>(),
    ),
  );
}
