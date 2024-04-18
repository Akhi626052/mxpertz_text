import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bottom Navigation Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatefulWidget {
  MyData? data;
  ProfileScreen({this.data});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List<File> _selectedImages = [];
  String commentInput = '';

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxHeight: 200,
      maxWidth: 200,
    );

    if (pickedFile != null) {
      setState(() {
        _selectedImages.add(File(pickedFile.path));
        print('Image added: ${_selectedImages.last}');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Center(child: Text('Detail Screen',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20,),
          Center(
            child: Container(
              margin: EdgeInsets.only(left: 15),
              child: ClipOval(
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue, width: 3),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: CircleAvatar(
                    backgroundImage: AssetImage("assets/images/mane_ig.png"),
                    radius: 40,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20,),
          Text("UserName: ${widget.data?.field1}"),
          Text("Email: ${widget.data?.field2}"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: _pickImage,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 50,vertical: 15),
                  child: Icon(Icons.add_box,size: 40,),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 50),
                child: Icon(Icons.smart_display_outlined,size: 40,),
              ),
            ],
          ),
          Container(
            color: Colors.black,
            height: 0.5,
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 4.0,
                crossAxisSpacing: 4.0,
              ),
              itemCount: _selectedImages.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Colors.black),
                    ),
                    width: 200,
                    height: 400,
                    child: Image.file(
                      _selectedImages[index],
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class MyData {
  int? id;
  String field1;
  String field2;
  String field3;

  MyData({this.id,required this.field1, required this.field2, required this.field3});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'field1': field1,
      'field2': field2,
      'field3': field3,
    };
  }
}

class DatabaseHelper {
  static final _databaseName = "MyDatabase.db";
  static final _databaseVersion = 1;
  static final table = 'my_table';
  static final columnId = '_id';
  static final columnData1 = 'field1';
  static final columnData2 = 'field2';
  static final columnData3 = 'field3';

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table (
            $columnId INTEGER PRIMARY KEY,
            $columnData1 TEXT,
            $columnData2 TEXT,
            $columnData3 TEXT
          )
          ''');
  }

  Future<int> insertData(MyData data) async {
    Database db = await instance.database;
    Map<String, dynamic> row = {
      DatabaseHelper.columnData1: data.field1,
      DatabaseHelper.columnData2: data.field2,
      DatabaseHelper.columnData3: data.field3,
    };
    // return await db.insert(DatabaseHelper.table, row);
    return await db.insert(table, row, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<MyData>> getData() async {
    print("GetData Method is run success fully");
    Database db = await instance.database;
    final List<Map<String, dynamic>> maps = await db.query(table);
    return List.generate(maps.length, (i) {
      return MyData(
        id: maps[i][columnId],
        field1: maps[i][columnData1],
        field2: maps[i][columnData2],
        field3: maps[i][columnData3],
      );
    });
  }
}
