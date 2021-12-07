import 'package:flutter_meedu/flutter_meedu.dart';
import 'package:tyfon/app/domain/repositories/authentification_repository.dart';

class DeleteUserCurrent extends SimpleNotifier {
  final _authentificationRepository = Get.i.find<AuthentificationRepository>();

  Future<String?> submit() {
    return _authentificationRepository.cleanAccountFirebase();
  }
}
