import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
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
abstract class AuthState extends Equatable {
  const AuthState();
  @override
  List<Object> get props => [];
}
class Unauthenticated extends AuthState {}
class Authenticated extends AuthState {
  final User user;
  Authenticated({required this.user});
  @override
  List<Object> get props => [user];
}