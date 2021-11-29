import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:tyfon/app/data/repositories_impl/authentification_repository_impl.dart';
import 'package:tyfon/app/data/repositories_impl/sign_up_repositories_impl.dart';
import 'package:tyfon/app/domain/repositories/authentification_repository.dart';
import 'package:tyfon/app/domain/repositories/sign_up_repository.dart';

void injectDependencies() {
  Get.i.put<AuthentificationRepository>(
    AuthentificationRepositoryImpl(FirebaseAuth.instance),
  );
  Get.i.put<SignUpRepository>(
    SignUpRepositoryImpl(FirebaseAuth.instance),
  );
}
