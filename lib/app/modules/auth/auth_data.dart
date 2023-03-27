import 'package:isar/isar.dart';

@Collection()
class AuthData {
  Id id = Isar.autoIncrement;
  String? code;
  AuthData({this.code});
}