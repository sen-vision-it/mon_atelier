import 'package:isar/isar.dart';
import 'package:mon_atelier/app/modules/utilisateur/utilisateur.dart';

class IsarDb {
  static late Future<Isar> db;

  IsarDb() {
    db = openDB();
  }

  static Future<Isar> openDB() async {
    if (Isar.instanceNames.isEmpty) {
      return await Isar.open(
        [UtilisateurSchema],
        inspector: true,
      );
    }
    return Future.value(Isar.getInstance());
  }
}
