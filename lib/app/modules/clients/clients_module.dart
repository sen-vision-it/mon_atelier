import 'package:mon_atelier/app/modules/clients/clients_cubit.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ClientsModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => ClientsCubit()),
  ];

  @override
  final List<ModularRoute> routes = [];
}
