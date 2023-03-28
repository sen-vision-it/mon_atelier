import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mon_atelier/app/modules/utilisateur/utilisateur_cubit.dart';
 
void main() {

  blocTest<UtilisateurCubit, int>('emits [1] when increment is added',
    build: () => UtilisateurCubit(),
    act: (cubit) => cubit.increment(),
    expect: () => [1],
  );
}