import 'package:flutter_test/flutter_test.dart';
import 'package:mon_atelier/app/modules/utilisateur/utilisateur_repository.dart';
 
void main() {
  late UtilisateurRepository repository;

  setUpAll(() {
    repository = UtilisateurRepository();
  });
}