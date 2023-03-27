import 'package:bloc/bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:isar/isar.dart';

import 'user.dart';

part 'auth_cubit.dart';

class AuthModule extends Module {
  @override
  List<Bind<Object>> get binds => [
    Bind.lazySingleton((i) => Isar()),
    Bind.lazySingleton((i) => AuthCubit(i.get())),
  ];

  @override
  List<ModularRoute> get routes => [
    CubitRoute('/auth', cubit: AuthCubit),
  ];
}

class AuthCubit extends Cubit<AuthState> {
  final Isar _isar;

  AuthCubit(this._isar) : super(AuthState.initial());

  Future<void> register(String name, int pinCode) async {
    final user = User(name: name, pinCode: pinCode);
    await _isar.writeTxn((isar) => isar.user.put(user));
    emit(AuthState.authenticated(user));
  }

  Future<void> authenticate(int pinCode) async {
    final user = await _isar.user.where().pinCodeEqualTo(pinCode).findFirst();
    if (user != null) {
      emit(AuthState.authenticated(user));
    } else {
      emit(AuthState.unauthenticated());
    }
  }
}

class AuthState {
  final User? user;

  AuthState(this.user);

  factory AuthState.initial() => AuthState(null);

  factory AuthState.authenticated(User user) => AuthState(user);

  factory AuthState.unauthenticated() => AuthState(null);

  bool get isAuthenticated => user != null;
}
