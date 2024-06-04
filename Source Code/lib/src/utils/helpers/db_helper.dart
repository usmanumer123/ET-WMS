import 'dart:async';
import 'dart:io';
import 'package:flutter_application_1/src/models/task_model.dart';
import 'package:flutter_application_1/src/utils/uidata/staticData.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper extends GetxController {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? database;

  factory DatabaseHelper() => _instance;

  DatabaseHelper._internal();
  String androidDbPath = '';
  createFolder() async {
    var path = await getExternalStorageDirectory();

    List folders = path!.path.split('/');
    var status = await Permission.manageExternalStorage.status;
    for (var i = 1; i < folders.length; i++) {
      if (folders[i] != 'Android') {
        // ignore: prefer_interpolation_to_compose_strings
        androidDbPath += '/' + folders[i];
      } else {
        break;
      }
    }

    androidDbPath = '$androidDbPath/ET-AMS';

    if (!status.isGranted) {
      await Permission.manageExternalStorage.request();
      await Permission.storage.request();
      await Permission.accessMediaLocation.request();
    }

    final dir = Directory(androidDbPath);
    if (await dir.exists()) {
      return dir.path; // Folder already exists
    } else {
      print(status.isGranted);
      dir.create(recursive: true);
      print('doneeeeeeee');
      // return dir.path; // New folder created
    }
  }

  Future<Database> get databasee async {
    if (Platform.isAndroid) {
      await createFolder();
    }

    if (database == null) {
      database = await initializeDatabase();
      print('jjj');
    }
    return database!;
  }

  Future<Database> initializeDatabase() async {
    final dbPath = Platform.isAndroid ? androidDbPath : getDatabasesPath();

    const dbName = 'rfid.db';
    print('creating');
    return await openDatabase(
      '$dbPath/databases/$dbName',
      version: 1,
      onCreate: (db, version) async {
        print('object');
        await db.execute(
            'CREATE TABLE assets (id INTEGER PRIMARY KEY AUTOINCREMENT, productId TEXT, brand TEXT, description TEXT, purchaseDate TEXT, category TEXT, model TEXT, serialNumber TEXT, cost TEXT, assignedTo TEXT, lastScanDate TEXT, dueDate TEXT, disposeDate TEXT, createdDate TEXT, site TEXT, location TEXT, depreciation TEXT, depreciationMethod TEXT, totalCost TEXT, assetLife TEXT, salvageValue TEXT, dateAquired TEXT, img  TEXT)');
        for (var i = 0; i < data.length; i++) {
          print(i);
          await db.insert('assets', data[i]);
        }
      },
    );
  }

  Future<int> insertTask(Task task) async {
    final db = await databasee;
    print(task.toMap());
    return await db.insert('assets', task.toMap()
        // {
        //   "ProductId": "L-1001",
        //   "Brand": "lenovo",
        //   "Description": "Laptop",
        //   "PurchaseDate": "01/01/2020".toString(),
        //   "Category": "HP",
        //   "Model": "thinkbook g4",
        //   "SerialNumber": "MP24C06F",
        //   "Cost": "8000.0",
        //   "AssignedTo": "NA",
        //   "LastScanDate": "03/20/2024".toString(),
        //   "DueDate": "NA",
        //   "DisposeDate": "NA",
        //   "CreatedDate": "03/20/2024".toString(),
        //   "Site": "Lahore Office",
        //   "Location": "HAFIZ CENTER",
        //   "Depreciation": "Yes",
        //   "DepreciationMethod": "Sum of the Years Digits",
        //   "TotalCost": "99",
        //   "AssetLife": "66",
        //   "SalvageValue": "99",
        //   "DateAquired": "04/16/2024".toString(),
        //   "img": 'na'
        // },
        );
  }

  getTasks(String table) async {
    final db = await databasee;
    final List<Map<String, dynamic>> maps = await db.query(table);
    // print(maps);
    // return List.generate(maps.length, (i) => Task.fromMap(maps[i]));
    return maps;
  }

  Future<void> updateTask(Task task) async {
    final db = await databasee;
    await db.update(
      'assets',
      task.toMap(),
      where: 'id = ?',
      whereArgs: [task.productId],
    );
  }

  Future<void> deleteTask(int id) async {
    final db = await databasee;
    await db.delete(
      'assets',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> deleteTable(String tableName) async {
    final database = await databasee;
    await database
        .execute("DROP TABLE IF EXISTS $tableName"); // Use IF EXISTS for safety
  }

  delettte() async {
    final dbPath = await getDatabasesPath();
    const dbName = 'rfid.db';
    deleteDatabase('$dbPath/$dbName');
    print(';;;;;');
  }
}
