import 'package:bank_nordik/data/datasource/auth_datasource.dart';
import 'package:bank_nordik/data/service/auth_repos_impl.dart';
import 'package:bank_nordik/data/service/router_repos_impl.dart';
import 'package:bank_nordik/domain/repositories/auth_repository.dart';
import 'package:bank_nordik/domain/repositories/router_repository.dart';
import 'package:bank_nordik/domain/usecase/auth/emailCheck_usecase.dart';
import 'package:bank_nordik/domain/usecase/auth/getUserdata_usecase.dart';
import 'package:bank_nordik/domain/usecase/auth/login_usecase.dart';
import 'package:bank_nordik/domain/usecase/auth/register_usecase.dart';
import 'package:bank_nordik/domain/usecase/router/router_usecase.dart';
import 'package:bank_nordik/presentation/bloc/auth/login_bloc.dart';
import 'package:bank_nordik/presentation/bloc/auth/registration_bloc.dart';
import 'package:bank_nordik/presentation/bloc/router_bloc.dart';
import 'package:bank_nordik/presentation/bloc/user_bloc.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void init() {
  //USECASE
  locator
      .registerLazySingleton(() => RouterUsecase(routerRepository: locator()));
  locator
      .registerLazySingleton(() => RegisterUsecase(authRepository: locator()));
  locator.registerLazySingleton(
      () => EmailCheckUseCase(authRepository: locator()));
  locator.registerLazySingleton(() => LoginUsecase(authRepository: locator()));
  locator.registerLazySingleton(
      () => GetUserDataUsecase(authRepository: locator()));

  //REPOSITORY
  locator.registerLazySingleton<RouterRepository>(() => RouterReposImpl());
  locator.registerLazySingleton<AuthRepository>(
      () => RegisterReposImpl(authDatasource: locator()));

  //DATASOURCE
  locator.registerLazySingleton<AuthDatasource>(() => AuthDatasourceImpl());

  //BLOC
  locator.registerLazySingleton(() => RouterCubit(routerUsecase: locator()));
  locator.registerLazySingleton(
    () => RegistrationCubit(
      RegisterUsecase(authRepository: locator()),
      EmailCheckUseCase(authRepository: locator()),
    ),
  );
  locator.registerLazySingleton(() => LoginCubit(locator()));
  locator.registerLazySingleton(() => UserBloc(getUserDataUsecase: locator()));
}
