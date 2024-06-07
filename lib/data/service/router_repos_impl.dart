import 'package:bank_nordik/domain/repositories/router_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RouterReposImpl extends RouterRepository {
  @override
  Future<void> firstTimeDone() async {
    final pref = await SharedPreferences.getInstance();
    pref.setBool('firstTime', false);
  }

  @override
  Future<bool> isFirstTime() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getBool('firstTime') ?? true;
  }
}
