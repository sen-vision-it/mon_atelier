import 'package:bloc/bloc.dart';

class ClientsCubit extends Cubit<int> {
  ClientsCubit() : super(0);

  @override
  void increment() => emit(state+1);

}