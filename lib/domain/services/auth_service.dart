import 'dart:async';
import 'package:iherb/data/models/user_model.dart';
import 'package:stacked/stacked.dart';
import 'package:iherb/domain/repository/auth/auth_repository.dart';

class AuthService with ReactiveServiceMixin {
  AuthService({required this.authRepository}) {
    init();
    listenToReactiveValues([user]);
  }

  final AuthRepository authRepository;

  Completer inited = Completer();

  ReactiveValue<UserModel?> user = ReactiveValue<UserModel?>(null);

  bool get isLoggined => user.value != null;

  Future<void> init() async {
    user.value = await authRepository.getUser();
    inited.complete();
  }

  Future<void> register(UserModel _user) async {
    await authRepository.register(_user);
    user.value = _user;
    if (user.value != null) {
      authRepository.saveUser(user.value!);
    }
  }
}
