import 'package:bank_nordik/data/service/router_repos_impl.dart';
import 'package:bank_nordik/domain/repositories/router_repository.dart';
import 'package:bank_nordik/domain/usecase/router/router_usecase.dart';
import 'package:bank_nordik/presentation/bloc/router_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'presentation/routes/router.dart';
import 'presentation/shared/theme.dart';
import './locator.dart' as di;

void main() {
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late MyRouterDelegate routerDelegate;
  @override
  void initState() {
    RouterRepository routerRepository = RouterReposImpl();

    routerDelegate = MyRouterDelegate(
      RouterCubit(
          routerUsecase: RouterUsecase(routerRepository: routerRepository)),
    );
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => di.locator<RouterCubit>())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          scaffoldBackgroundColor: lightBackgroundColor,
          appBarTheme: AppBarTheme(
            backgroundColor: lightBackgroundColor,
            elevation: 0,
            centerTitle: true,
            iconTheme: IconThemeData(
              color: blackColor,
            ),
            titleTextStyle: blackTextStyle.copyWith(
              fontSize: 20,
              fontWeight: semiBold,
            ),
          ),
        ),
        home: Router(
          routerDelegate: routerDelegate,
          backButtonDispatcher: RootBackButtonDispatcher(),
        ),
      ),
    );
  }
}
