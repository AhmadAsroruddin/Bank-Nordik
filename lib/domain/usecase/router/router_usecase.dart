import 'package:bank_nordik/domain/repositories/router_repository.dart';

class RouterUsecase {
  final RouterRepository routerRepository;

  RouterUsecase({required this.routerRepository});

  Future<void> firstTimeDoneExecute() async {
    routerRepository.firstTimeDone();
  }

  Future<bool> isFirstTimeCheckExecute() async {
    return routerRepository.isFirstTime();
  }
}
