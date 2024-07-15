import 'package:mysql1/mysql1.dart';

class DatabaseService {
  static Future<MySqlConnection> createConnection() async {
    final settings = ConnectionSettings(
      host: '34.101.79.44',
      port: 3306,
      user: 'user_exam10',
      password: '@user_exam10',
      db: 'db_exam10',
    );
    final result = await MySqlConnection.connect(settings);

    return result;
  }
}
