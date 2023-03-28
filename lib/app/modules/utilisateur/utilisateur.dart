import 'package:isar/isar.dart';

part 'utilisateur.g.dart';

@Collection()
class Utilisateur {
  Id id=Isar.autoIncrement;
  @Index()
  late String nom;
  int? code;

  Utilisateur({required this.nom, this.code});
}
