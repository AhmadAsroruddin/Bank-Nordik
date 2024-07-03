import 'package:bank_nordik/data/datasource/auth_datasource.dart';
import 'package:bank_nordik/data/service/register_repos_impl.dart';
import 'package:bank_nordik/data/service/router_repos_impl.dart';
import 'package:bank_nordik/domain/repositories/auth_repository.dart';
import 'package:bank_nordik/domain/repositories/router_repository.dart';
import 'package:bank_nordik/domain/usecase/auth/register_usecase.dart';
import 'package:bank_nordik/domain/usecase/router/router_usecase.dart';
import 'package:bank_nordik/presentation/bloc/auth/registration_bloc.dart';
import 'package:bank_nordik/presentation/bloc/router_bloc.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void init() {
  //USECASE
  locator
      .registerLazySingleton(() => RouterUsecase(routerRepository: locator()));
  locator
      .registerLazySingleton(() => RegisterUsecase(authRepository: locator()));

  //REPOSITORY
  locator.registerLazySingleton<RouterRepository>(() => RouterReposImpl());
  locator.registerLazySingleton<AuthRepository>(
      () => RegisterReposImpl(authDatasource: locator()));

  //DATASOURCE
  locator.registerLazySingleton<AuthDatasource>(() => AuthDatasourceImpl());

  //BLOC
  locator.registerLazySingleton(() => RouterCubit(routerUsecase: locator()));
  locator.registerLazySingleton(
      () => RegistrationCubit(RegisterUsecase(authRepository: locator())));
}
