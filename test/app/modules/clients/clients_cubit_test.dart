import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mon_atelier/app/modules/clients/clients_cubit.dart';
 
void main() {

  blocTest<ClientsCubit, int>('emits [1] when increment is added',
    build: () => ClientsCubit(),
    act: (cubit) => cubit.increment(),
    expect: () => [1],
  );
}