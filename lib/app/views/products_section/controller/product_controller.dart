import 'package:flutter_meedu/flutter_meedu.dart';
import 'package:tyfon/app/domain/repositories/authentification_repository.dart';

class ProductController extends SimpleNotifier {
  final _authentificationRepository = Get.i.find<AuthentificationRepository>();

  Future<String?> submit(text) {
    return _authentificationRepository.saveOrders(text);
  }
}
