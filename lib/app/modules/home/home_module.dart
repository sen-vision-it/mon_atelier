import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_bloc_bind/modular_bloc_bind.dart';
import '../utilisateur/utilisateur_cubit.dart';
import 'counter_cubit.dart';
import 'home_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    BlocBind.lazySingleton((i) => CounterCubit()),
    BlocBind.lazySingleton((i) => UtilisateurCubit(i.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (context, args) => HomePage()),
  ];
}