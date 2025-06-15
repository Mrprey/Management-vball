import 'package:get_it/get_it.dart';
import 'package:volei_project/data/repositories/player_repository_impl.dart';
import 'package:volei_project/domain/repositories/player_repository.dart';
import 'package:volei_project/domain/use_cases/player_use_cases.dart';
import 'package:volei_project/presentation/view_models/player_view_model.dart';

final GetIt getIt = GetIt.instance;

void setupServiceLocator() {
  // Repositórios
  getIt.registerLazySingleton<PlayerRepository>(
    () => PlayerRepositoryImpl(),
  );

  // Casos de uso
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
