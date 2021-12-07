import 'package:flutter_meedu/flutter_meedu.dart';
import 'package:tyfon/app/domain/repositories/authentification_repository.dart';

class ForgetPasswordController extends SimpleNotifier {
  String _email = '';
  String get email => _email;

  final _authentificationRepository = Get.i.find<AuthentificationRepository>();

  void onEmailChanged(String text) {
    _email = text;
  }

  Future<String?> submit() {
    return _authentificationRepository.sendResetPasswordLink(email);
  }
}
