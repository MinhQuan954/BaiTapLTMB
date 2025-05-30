import "../model/User.dart";
import "package:sqflite/sqflite.dart";
import 'package:path/path.dart';

class UserDatabaseHelper {
  static final UserDatabaseHelper instance = UserDatabaseHelper._init();
  static Database? _database;

  UserDatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('app_database.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
        CREATE TABLE users (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          name TEXT NOT NULL,
          email TEXT NOT NULL,
          phone TEXT NOT NULL,
          avatar TEXT,
          dateOfBirth TEXT NOT NULL
        )
      ''');

    // Tạo sẵn dữ liệu mẫu
    await _insertSampleData(db);
  }

  // Phương thức chèn dữ liệu mẫu
  Future _insertSampleData(Database db) async {
    // Danh sách dữ liệu mẫu
    final List<Map<String, dynamic>> sampleUsers = [
      {
        'name': 'Hoàng Minh Quân',
        'email': 'minhquan09504@gmail.com',
        'phone': '0862699954',
        'avatar': null,
        'dateOfBirth': DateTime(2004, 5, 9).toIso8601String(),
      },
      {
        'name': 'Lâm Quốc Bảo',
        'email': 'baocanada@gmail.com',
        'phone': '0912427765',
        'avatar': null,
        'dateOfBirth': DateTime(2004, 4, 13).toIso8601String(),
      },
      {
        'name': 'Hoàng Tuấn Phúc',
        'email': 'phucphowr@gmail.com',
        'phone': '0332155504',
        'avatar': null,
        'dateOfBirth': DateTime(2004, 10, 9).toIso8601String(),
      },
      {
        'name': 'Ngô Minh Tân',
        'email': 'tannhii@gmail.com',
        'phone': '0934567890',
        'avatar': null,
        'dateOfBirth': DateTime(2004, 1, 28).toIso8601String(),
      },
      {
        'name': 'Nguyễn Thái Bình',
        'email': 'binhpko@gmail.com',
        'phone': '0945678901',
        'avatar': null,
        'dateOfBirth': DateTime(2004, 10, 1).toIso8601String(),
      },
      {
        'name': 'Dương Chí Khang',
        'email': 'pedaucute@gmail.com',
        'phone': '0945678901',
        'avatar': null,
        'dateOfBirth': DateTime(2004, 6, 6).toIso8601String(),
      },
    ];

    // Chèn từng người dùng vào cơ sở dữ liệu
    for (final userData in sampleUsers) {
      await db.insert('users', userData);
    }
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }

  /*
  instance: Singleton pattern đảm bảo chỉ có một instance của DatabaseHelper
  database: Getter trả về instance của Database, tạo mới nếu chưa tồn tại
  _initDB: Khởi tạo database với đường dẫn cụ thể
  _createDB: Tạo các bảng khi database được tạo lần đầu
  close: Đóng kết nối database
   */

  // Create - Thêm user mới
  Future<int> createUser(User user) async {
    final db = await instance.database;
    return await db.insert('users', user.toMap());
  }

  // Read - Đọc tất cả users
  Future<List<User>> getAllUsers() async {
    final db = await instance.database;
    final result = await db.query('users');

    return result.map((map) => User.fromMap(map)).toList();
  }

  // Read - Đọc user theo id
  Future<User?> getUserById(int id) async {
    final db = await instance.database;
    final maps = await db.query('users', where: 'id = ?', whereArgs: [id]);

    if (maps.isNotEmpty) {
      return User.fromMap(maps.first);
    }
    return null;
  }

  // Update - Cập nhật user
  Future<int> updateUser(User user) async {
    final db = await instance.database;
    return await db.update(
      'users',
      user.toMap(),
      where: 'id = ?',
      whereArgs: [user.id],
    );
  }

  // Delete - Xoá user
  Future<int> deleteUser(int id) async {
    final db = await instance.database;
    return await db.delete('users', where: 'id = ?', whereArgs: [id]);
  }

  // Delete - Xoá tất cả users
  Future<int> deleteAllUsers() async {
    final db = await instance.database;
    return await db.delete('users');
  }

  // Đếm số lượng users
  Future<int> countUsers() async {
    final db = await instance.database;
    final result = await db.rawQuery('SELECT COUNT(*) FROM users');
    return Sqflite.firstIntValue(result) ?? 0;
  }
}