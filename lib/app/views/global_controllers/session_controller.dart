import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_meedu/flutter_meedu.dart';
import 'package:tyfon/app/domain/repositories/authentification_repository.dart';

class SessionController extends SimpleNotifier {
  User? _user;
  User? get user => _user;

  final _auth = Get.i.find<AuthentificationRepository>();

  void setUser(User user) {
    _user = user;
    notify();
  }

  Future<void> SignOut() async {
    await _auth.signOut();
    _user = null;
  }
}

final sessionProvider = SimpleProvider(
  (_) => SessionController(),
  autoDispose: false,
);
