/*
part of 'auth_cubit.dart';

@immutable
abstract class AuthState extends Equatable {

  const AuthState();
  @override
  List<Object> get props => [];

}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {}

class AuthFailure extends AuthState {}

class Unauthenticated extends AuthState {}

class Authenticated extends AuthState {
  final User user;
  const Authenticated({required this.user});
  @override
  List<Object> get props => [user];
}*/
