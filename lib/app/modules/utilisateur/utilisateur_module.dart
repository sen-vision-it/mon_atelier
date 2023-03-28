import 'package:mon_atelier/app/modules/utilisateur/pages/enregistrer_utilisateur_page.dart';
import 'package:mon_atelier/app/modules/utilisateur/pages/login_page.dart';
import 'package:mon_atelier/app/modules/utilisateur/utilisateur_repository.dart';
import 'package:mon_atelier/app/modules/utilisateur/utilisateur_cubit.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mon_atelier/app/modules/utilisateur/widgets/code_widget.dart';

class UtilisateurModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => UtilisateurRepository()),
    Bind.lazySingleton((i) => UtilisateurCubit(i.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, __) => CodeWidget()),
    ChildRoute('/register', child: (_, __) => EnregistrerUtilisateurPage()),
    ChildRoute('/login', child: (_, __) => LoginPage()),
  ];


  /*@override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (_, __) => PinCodeWidget()),
    ChildRoute('/register', child: (_, __) => RegisterPage()),
    ChildRoute('/login', child: (_, __) => LoginPage()),
  ];*/
}
