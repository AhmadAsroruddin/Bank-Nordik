import 'package:bank_nordik/domain/usecase/router/router_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RouterCubit extends Cubit<bool> {
  final RouterUsecase routerUsecase;

  RouterCubit({required this.routerUsecase}) : super(false);

  Future<bool> checkFirstTime() async {
    return routerUsecase.isFirstTimeCheckExecute();
  }

  Future<void> firstTimeDone() async {
    routerUsecase.firstTimeDoneExecute();
  }
}
