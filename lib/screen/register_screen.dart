import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';    // join error resolve this package
import '../bottom_navigation_screen.dart';
// Model class to represent data
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

// Database helper class
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








void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RegisterScreen(),
    );
  }
}

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _agreeToTerms = false;
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  void _saveProfile(BuildContext context) {
    // Save profile logic here
    String username = _usernameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;
   // comment profile screen navigator
    // Navigate to second screen and pass the entered information
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) =>
    //         ProfileScreen(
    //           username: username,
    //           email: email,
    //           password: password,
    //         ),
    //   ),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Register with Skenu',
          style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.yellow,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        centerTitle: true,
        toolbarHeight: 60, // Set the height of the AppBar to include top margin
      ),
      backgroundColor: Color(0xFF011D45),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Username TextField
              TextField(
                controller: _usernameController,
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Colors.yellow, // Set border color here
                      width: 2.0, // Set border width here
                    ),
                  ),
                  enabledBorder: OutlineInputBorder( // To remove the default border color
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
          
                  hintText: 'Username',
                  filled: true,
                  fillColor: Color(0xff001533),
                  hintStyle: TextStyle(color: Colors.white),
          
          
          
          
          
                ),
                style: TextStyle(color: Colors.white),
              ),
          
              SizedBox(height: 10),
              // Email TextField
              TextField(
                controller: _emailController,
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Colors.yellow, // Set border color here
                      width: 2.0, // Set border width here
                    ),
                  ),
                  enabledBorder: OutlineInputBorder( // To remove the default border color
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  hintText: 'Email',
                  filled: true,
                  fillColor: Color(0xff001533),
                  hintStyle: TextStyle(color: Colors.white),
                ),
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 10),
              // Password TextField
              TextField(
                controller: _passwordController,
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Colors.yellow, // Set border color here
                      width: 2.0, // Set border width here
                    ),
                  ),
                  enabledBorder: OutlineInputBorder( // To remove the default border color
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  hintText: 'Password',
                  filled: true,
                  fillColor: Color(0xff001533),
                  hintStyle: TextStyle(color: Colors.white),
                ),
                style: TextStyle(color: Colors.white),
                obscureText: true,
              ),
              SizedBox(height: 10),
              // Confirm Password TextField
              TextField(
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Colors.yellow, // Set border color here
                      width: 2.0, // Set border width here
                    ),
                  ),
                  enabledBorder: OutlineInputBorder( // To remove the default border color
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  hintText: 'Confirm Password',
                  filled: true,
                  fillColor: Color(0xff001533),
                  hintStyle: TextStyle(color: Colors.white),
                ),
                style: TextStyle(color: Colors.white),
                obscureText: true,
              ),
              SizedBox(height: 10),
              // Checkbox
              Row(
                children: <Widget>[
                  Theme(
                    data: ThemeData(
                      unselectedWidgetColor: Colors.white, // Set color of the checkbox when it's not selected to white
                      hoverColor: Colors.white, // Set color of the checkbox when it's not active to white
                    ),
                    child: Checkbox(
                      value: _agreeToTerms,
                      onChanged: (bool? newValue) {
                        if (newValue != null) {
                          setState(() {
                            _agreeToTerms = newValue;
                          });
                        }
                      },
                      activeColor: Colors.white, // Set color of the box inside checkbox to white
                      checkColor: Color(0xff001533), // Set check color
                    ),
                  ),
                  SizedBox(width: 10), // Optional: Add spacing between checkbox and text
                  Text(
                    'Agree to terms and conditions',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
          
              SizedBox(height: 10),
              // Register Button
              GestureDetector(
                
                onTap: () async{
                  // Sqlite data base save in cache memory
                  await DatabaseHelper.instance.insertData(MyData(
                    field1: _usernameController.text,
                    field2: _emailController.text,
                    field3: _passwordController.text,
                  ));
                  // Navigator.pushReplacement(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => ProfileScreen()),
                  // );
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => BottomNavigationDemo()),
                  );
                  // end Sqlite data base save in cache memory
                  // Handle register button tap
                  print('Register button tapped');
                  // value send
                  _saveProfile(context);
                  
          
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => BottomNavigationDemo()),
                  //
                  // );
          
                },
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(15),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    'Register',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
          
          
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
