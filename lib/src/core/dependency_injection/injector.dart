import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/home/home.dart';
import '../../features/map/map.dart';
import '../../features/passbook/passbook.dart';

GetIt get injector => GetIt.instance;

abstract class DependencyInjection {
  static initialize() {
    // DIO
    injector.registerFactory<Dio>(() => Dio());

    // DATASOURCES
    injector.registerFactory<MapDatasource>(
      () => MapRemoteDatasource(injector()),
    );

    // REPOSITORIES
    injector.registerFactory<MapRepository>(
      () => MapRepositoryImpl(
        remoteDatasource: injector(),
      ),
    );

    // BLOCS AND CUBITS
    injector.registerFactory<HomeCubit>(
      () => HomeCubit(),
    );
    injector.registerFactory<MapCubit>(
      () => MapCubit(
        mapRepository: injector(),
      ),
    );
    injector.registerFactory<PassbookCubit>(
      () => PassbookCubit(),
    );
  }
}
