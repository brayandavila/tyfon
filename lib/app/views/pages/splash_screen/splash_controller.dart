import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_meedu/flutter_meedu.dart';
import 'package:tyfon/app/domain/repositories/authentification_repository.dart';
import 'package:tyfon/app/views/global_controllers/session_controller.dart';
import 'package:tyfon/app/views/routes/routes.dart';
import 'package:flutter_meedu/flutter_meedu.dart';

class SplashController extends SimpleNotifier {
  final SessionController _sessionController;
  final _authRepository = Get.i.find<AuthentificationRepository>();

  Future<String?> submit() {
    return _authRepository.generateUserByUid();
  }

  String? _routeName;
  String? get routeName => _routeName;

  SplashController(this._sessionController) {
    _init();
  }

  void _init() async {
    final user = await _authRepository.user;
    if (user != null) {
      _routeName = Routes.LAYERNAV;
      _sessionController.setUser(user);
    } else {
      _routeName = Routes.LOGIN;
    }

    notify();
  }
}
