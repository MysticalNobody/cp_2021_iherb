import 'dart:async';
import 'package:stacked/stacked.dart';
import 'package:iherb/domain/repository/auth/auth_repository.dart';

class AuthService {
  AuthService({required this.authRepository}) {
    init();
  }

  final AuthRepository authRepository;

  Completer inited = Completer();

  Future<void> init() async {
    token.value = await authRepository.getToken();
    inited.complete();
  }

  ReactiveValue<String?> token = ReactiveValue<String?>(null);

  Future<bool> signIn() async {
    token.value = 'token';
    return authRepository.signIn('token');
  }

  Future<void> singOut() async {
    token.value = null;
    return authRepository.signOut();
  }
}
