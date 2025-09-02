import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:soand/core/network/dio_handler.dart';
import 'package:soand/core/services/shared_preference_manager.dart';
import 'package:soand/features/auth/data/data_source/data_source.dart';
import 'package:soand/features/auth/data/repository/repository.dart';

final GetIt serviceLocator = GetIt.instance;

Future<void> setupServiceLocator() async {
  await SharedPreferenceManager.getInstance();

  serviceLocator.registerSingletonAsync(
    () async => await SharedPreferences.getInstance(),
  );
  serviceLocator.registerLazySingleton(() => DioSettings());

  serviceLocator.registerLazySingleton(
    () => AuthDataSourceImpl(serviceLocator<DioSettings>().dio()),
  );
  serviceLocator.registerLazySingleton(
    () => AuthRepositoryImpl(
      authDataSource: serviceLocator<AuthDataSourceImpl>(),
    ),
  );
}
