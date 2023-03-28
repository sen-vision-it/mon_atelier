/*
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:mon_atelier/app/modules/auth/user.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(Unauthenticated());
  void authenticate(String username, int pin) async {
    final user = await DatabaseService.getUserByUsername(username);
    if (user != null && user.pin == pin) {
      emit(Authenticated(user: user));
    } else {
      emit(Unauthenticated());
    }
  }
  void logout() {
    emit(Unauthenticated());
  }
}

*/
