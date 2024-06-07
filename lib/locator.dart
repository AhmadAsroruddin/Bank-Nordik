import 'package:bank_nordik/data/service/router_repos_impl.dart';
import 'package:bank_nordik/domain/repositories/router_repository.dart';
import 'package:bank_nordik/domain/usecase/router/router_usecase.dart';
import 'package:bank_nordik/presentation/bloc/router_bloc.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void init() {
  //USECASE
  locator
      .registerLazySingleton(() => RouterUsecase(routerRepository: locator()));

  //REPOSITORY
  locator.registerLazySingleton<RouterRepository>(() => RouterReposImpl());

  //BLOC
  locator.registerLazySingleton(() => RouterCubit(routerUsecase: locator()));
}
