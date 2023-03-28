import 'package:isar/isar.dart';
import 'package:mon_atelier/app/modules/utilisateur/utilisateur.dart';
import 'package:mon_atelier/app/IsarDb.dart';

class UtilisateurRepository {

  Future<void> saveUtilisateur(Utilisateur user) async {
    final isar = await IsarDb.db;
    isar.writeTxnSync<int>(() => isar.utilisateurs.putSync(user));
  }

  Future<Utilisateur?> getUtilisateurByNom(String nom) async {
    final isar = await IsarDb.db;
    return await isar.utilisateurs.where().nomEqualTo(nom).findFirst();
  }

  Future<Utilisateur?> getUtilisateurById(int id) async {
    final isar = await IsarDb.db;
    return await isar.utilisateurs.get(id);
  }
}