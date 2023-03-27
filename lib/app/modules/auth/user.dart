import 'package:isar/isar.dart';

@Collection()
class User {
  Id id=Isar.autoIncrement;
  @Index()
  String name;
  int? pinCode;

  User({required this.name, this.pinCode});
}