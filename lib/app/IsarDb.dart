import 'package:isar/isar.dart';


class IsarDb {
  static late Isar _isar;

  /*static Future<void> init() async {
    final appDocDir = await getApplicationDocumentsDirectory();
    final dbPath = "${appDocDir.path}/isar.db";
    _isar = await openIsar(path: dbPath, schemaVersion: 1, onCreate: (isar) {
      isar.code().create();
    });
  }
*/
  static Isar get instance => _isar;

  static openIsar({required String path, required int schemaVersion, required Null Function(dynamic isar) onCreate}) {}
}
