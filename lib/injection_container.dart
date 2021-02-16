import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter_authentication/futures/authentication/data/data_sources/authentication_data_source.dart';
import 'package:flutter_authentication/futures/authentication/data/data_sources/login_data_source.dart';
import 'package:flutter_authentication/futures/authentication/data/data_sources/register_data_source.dart';
import 'package:flutter_authentication/futures/authentication/data/repositories/Authentication_Repository_impl.dart';
import 'package:flutter_authentication/futures/authentication/data/repositories/login_repository_impl.dart';
import 'package:flutter_authentication/futures/authentication/data/repositories/regester_repository_impl.dart';
import 'package:flutter_authentication/futures/authentication/domain/repositories/login_repository.dart';
import 'package:flutter_authentication/futures/authentication/domain/repositories/register_repository.dart';
import 'package:flutter_authentication/futures/authentication/domain/use_cases/DeleteAuthentication.dart';
import 'package:flutter_authentication/futures/authentication/domain/use_cases/addAuthentication.dart';
import 'package:flutter_authentication/futures/authentication/domain/use_cases/chekAuthentication.dart';
import 'package:flutter_authentication/futures/authentication/domain/use_cases/find_authentication.dart';
import 'package:flutter_authentication/futures/authentication/domain/use_cases/login_usecase.dart';
import 'package:flutter_authentication/futures/authentication/domain/use_cases/register_usecase.dart';
import 'package:flutter_authentication/futures/authentication/presentation/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:flutter_authentication/futures/authentication/presentation/bloc/loginBloc/login_bloc.dart';
import 'package:flutter_authentication/futures/authentication/presentation/bloc/register_bloc/register_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'core/network/network_info.dart';
import 'core/util/input_converter.dart';
import 'futures/authentication/domain/entities/authentication.dart';
import 'futures/authentication/domain/repositories/authentication_repositorie.dart';

final sl = GetIt.instance;
// final loginInjection = GetIt.instance;
// final registerInjection = GetIt.instance;
Future<void> init() async {
  // initAuthentication();
  // initLogin();
  // initRegister();

  //Bloc
  // sl.registerFactory(() =>
  //     AuthenticationBloc(add: sl(), check: sl(), delete: sl(), find: sl()));
  sl.registerFactory(() => AuthenticationBloc(find: sl()));

  //use cases
  // sl.registerLazySingleton(() => AddAuthenticationUsecase(repository: sl()));
  // sl.registerLazySingleton(() => CheckAuthenticationUsecase(repository: sl()));
  // sl.registerLazySingleton(() => DeleteAuthenticationUsecase(repository: sl()));
  sl.registerLazySingleton(() => FindAuthenticationUsecase(repository: sl()));
  // sl.registerLazySingleton(() => LoginUsecase(repository: sl()));

  //Repository
  sl.registerLazySingleton<AuthenticationRepository>(
    () => AuthenticationRepositoryImpl(
      dataSources: sl(),
    ),
  );

  //Data Sources
  sl.registerLazySingleton<AuthenticationDataSources>(
      () => AuthenticationDataSourcesImpl(sharedPreferences: sl()));

  //core !!
  // sl.registerLazySingleton(() => InputConverter());
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => DataConnectionChecker());
}

// Future<void> initAuthentication() async {
//   //Bloc
//   sl.registerFactory(() =>
//       AuthenticationBloc(add: sl(), check: sl(), delete: sl(), find: sl()));
//
//   //use cases
//   sl.registerLazySingleton(() => AddAuthenticationUsecase());
//   sl.registerLazySingleton(() => CheckAuthenticationUsecase(repository: sl()));
//   sl.registerLazySingleton(() => DeleteAuthenticationUsecase(repository: sl()));
//   sl.registerLazySingleton(() => FindAuthenticationUsecase(repository: sl()));
//   // sl.registerLazySingleton(() => LoginUsecase(repository: sl()));
//
//   //Repository
//   sl.registerLazySingleton<AuthenticationRepository>(
//     () => AuthenticationRepositoryImpl(
//       dataSources: sl(),
//     ),
//   );
//
//   //Data Sources
//   sl.registerLazySingleton<AuthenticationDataSources>(
//       () => AuthenticationDataSourcesImpl(sharedPreferences: sl()));
//
//   //core !!
//   // sl.registerLazySingleton(() => InputConverter());
//   sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
//
//   //! External
//   final sharedPreferences = await SharedPreferences.getInstance();
//   sl.registerLazySingleton(() => sharedPreferences);
//   sl.registerLazySingleton(() => http.Client());
//   sl.registerLazySingleton(() => DataConnectionChecker());
// }

// Future<void> initLogin() {
//   //Bloc
//   loginInjection.registerFactory(() =>
//       LoginBloc(usecase: loginInjection(), ABloc: authenticationIjection()));
//
//   //usecases
//   loginInjection
//       .registerLazySingleton(() => LoginUsecase(repository: loginInjection()));
//
//   //repository
//   loginInjection.registerLazySingleton<LoginRepository>(
//       () => LoginRepositoryImpl(loginDataSource: loginInjection()));
//
//   //data sources
//   loginInjection.registerLazySingleton<LoginDataSource>(
//       () => LoginDataSourceImpl(client: loginInjection()));
//
//   //core !!
//   loginInjection.registerLazySingleton<NetworkInfo>(
//       () => NetworkInfoImpl(loginInjection()));
//
//   //! External
//   loginInjection.registerLazySingleton(() => http.Client());
//   loginInjection.registerLazySingleton(() => DataConnectionChecker());
// }

// Future<void> initRegister() {
//   registerInjection
//       .registerFactory(() => RegisterBloc(usecase: registerInjection()));
//
//   //usecase
//   registerInjection.registerLazySingleton(
//       () => RegisterUsecase(repository: registerInjection()));
//
//   //repository
//   registerInjection.registerLazySingleton<RegisterRepository>(() =>
//       RegisterRepositoryImpl(
//           networkInfo: registerInjection(),
//           registerDataSource: registerInjection()));
//
//   //data sources
//   registerInjection.registerLazySingleton<RegisterDataSource>(
//       () => RegisterDataSourceImpl(client: registerInjection()));
//
//   //core !!
//   registerInjection.registerLazySingleton<NetworkInfo>(
//       () => NetworkInfoImpl(loginInjection()));
//   //! External
// }
