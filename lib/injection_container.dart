import 'package:buscador_de_ceps/core/device/network_info.dart';
import 'package:buscador_de_ceps/data/datasource/search_cep_remote_datasource.dart';
import 'package:buscador_de_ceps/data/repositories/search_cep_repository.dart';
import 'package:buscador_de_ceps/domain/repositories/i_search_cep_repository.dart';
import 'package:buscador_de_ceps/domain/usecase/get_search_cep_usecase.dart';
import 'package:buscador_de_ceps/presentation/bloc/search_cep_bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;
Future<void> init() async {
  sl.registerLazySingleton<INetworkInfo>(() => NetworkInfo(sl()));
  sl.registerLazySingleton(() => Connectivity());
  sl.registerLazySingleton(() => http.Client());

  sl.registerLazySingleton(() => SearchCepBloc(sl()));
  sl.registerLazySingleton(() => GetSearchCepUsecase(sl()));
  sl.registerLazySingleton<ISearchCepRepository>(
      () => SearchCepRepository(sl()));
  sl.registerLazySingleton<ISearchCepRemoteDataSource>(
      () => SearchCepRemoteDataSource(sl()));

  await sl.allReady();
}
