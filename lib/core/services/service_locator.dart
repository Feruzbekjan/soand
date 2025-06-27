import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:soand/core/network/dio_handler.dart';
import 'package:soand/core/services/shared_preference_manager.dart';

final GetIt serviceLocator = GetIt.instance;

Future<void> setupServiceLocator() async {
  await SharedPreferenceManager.getInstance();

  serviceLocator.registerSingletonAsync(
    () async => await SharedPreferences.getInstance(),
  );
  serviceLocator.registerLazySingleton(() => DioSettings());

  // serviceLocator.registerLazySingleton(
  //     () => CatalogDataSourceImpl(serviceLocator<DioSettings>().dio()));
  // serviceLocator.registerLazySingleton(() => CatalogRepositoryImpl(
  //     categoryDataSource: serviceLocator<CatalogDataSourceImpl>()));

  // serviceLocator.registerLazySingleton(
  //     () => AuthDataSourceImpl(serviceLocator<DioSettings>().dio()));
  // serviceLocator.registerLazySingleton(() =>
  //     AuthRepositoryImpl(authDataSource: serviceLocator<AuthDataSourceImpl>()));

  // serviceLocator.registerLazySingleton(
  //     () => HomeDataSourceImpl(serviceLocator<DioSettings>().dio()));
  // serviceLocator.registerLazySingleton(() =>
  //     HomeRepositoryImpl(homeDataSource: serviceLocator<HomeDataSourceImpl>()));

  // serviceLocator.registerLazySingleton(
  //     () => ProfilDataSourceImpl(serviceLocator<DioSettings>().dio()));
  // serviceLocator.registerLazySingleton(() => ProfilRepositoryImpl(
  //     profilDataSource: serviceLocator<ProfilDataSourceImpl>()));

  // serviceLocator.registerLazySingleton(
  //     () => OrdersDataSourseImpl(serviceLocator<DioSettings>().dio()));
  // serviceLocator.registerLazySingleton(() => OrdersRepositoryImpl(
  //     ordersDataSourse: serviceLocator<OrdersDataSourseImpl>()));
}
