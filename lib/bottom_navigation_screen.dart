import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mxpertz_text/screen/register_screen.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
// void main() {
//   runApp(MyApp());
// }
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Bottom Navigation Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: BottomNavigationDemo(),
//     );
//   }
// }

class BottomNavigationDemo extends StatefulWidget {
  @override
  _BottomNavigationDemoState createState() => _BottomNavigationDemoState();
}

class _BottomNavigationDemoState extends State<BottomNavigationDemo> {
  int _selectedIndex = 0;
  List<int> _history = [0];

  final List<Widget> _screens = [
    HomeScreen(),
    LikeScreen(),
    ShareScreen(),
    CommentScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _history.add(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_history.length == 1) {
          return true; // Close the app
        } else {
          setState(() {
            _history.removeLast();
            _selectedIndex = _history.last;
          });
          return false;
        }
      },
      child: Scaffold(
        // appBar: AppBar(
        //   title: Text('Bottom Navigation Demo'),
        // ),
        body: _screens[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Like',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.share),
              label: 'Share',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.comment),
              label: 'Comment',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // h----
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

                  SizedBox(height: 10,),


              // First item: Rounded shape plush Image
              GestureDetector(
                onTap: (){
                  print("open success fully screen");
                  // feal
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterScreen()),
                  );
                },
                child: Container(
                  width: 100,
                  height: 100,
                  child: Icon(
                    Icons.add_circle_outline,
                    size: 40,
                    color: Colors.black,
                  ),
                ),
              ),

              // Second item: Circular container with text "Visual 1 > 8"
              Container(
                width: 40,
                height: 40,
                child: Image.asset(
                  'assets/icons/skenu_app.png', // Replace 'icon.png' with your icon asset
                  width: 20,
                  height: 20,
                ),
              ),

              // Third item: Image icon with width and height set to 20
              Container(
                width: 40,
                height: 40,
                child: Image.asset(
                  'assets/icons/msg_ic.png', // Replace 'icon.png' with your icon asset
                  width: 20,
                  height: 20,
                ),
              ),





            ],
          ),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                    // 1
                GestureDetector(
                  onTap: (){
                    print("open success fully screen");
                    // feal
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProfileScreen()),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 15),
                    child: ClipOval(
                      child: Container(width: 80,height: 80,decoration: BoxDecoration(border: Border.all(color: Colors.blue,width: 3),borderRadius: BorderRadius.circular(50)),
                        child: CircleAvatar(
                          backgroundImage: AssetImage("assets/images/mane_ig.png"),
                          radius: 40,
                        ),),
                    ),
                  ),
                ),

                    // 2
                GestureDetector(
                  onTap: (){
                    print("open success fully screen");
                    // feal
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProfileScreen()),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 15),
                    child: ClipOval(
                      child: Container(width: 80,height: 80,decoration: BoxDecoration(border: Border.all(color: Colors.blue,width: 3),borderRadius: BorderRadius.circular(50)),
                        child: CircleAvatar(
                          backgroundImage: AssetImage("assets/images/main_ph.png"),
                          radius: 40,
                        ),),
                    ),
                  ),
                ),

                    // 3
                GestureDetector(
                  onTap: (){
                    print("open success fully screen");
                    // feal
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProfileScreen()),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 15),
                    child: ClipOval(
                      child: Container(width: 80,height: 80,decoration: BoxDecoration(border: Border.all(color: Colors.blue,width: 3),borderRadius: BorderRadius.circular(50)),
                        child: CircleAvatar(
                          backgroundImage: AssetImage("assets/images/mane_ig.png"),
                          radius: 40,
                        ),),
                    ),
                  ),
                ),
                     // 4
                GestureDetector(
                  onTap: (){
                    print("open success fully screen");
                    // feal
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProfileScreen()),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 15),
                    child: ClipOval(
                      child: Container(width: 80,height: 80,decoration: BoxDecoration(border: Border.all(color: Colors.blue,width: 3),borderRadius: BorderRadius.circular(50)),
                        child: CircleAvatar(
                          backgroundImage: AssetImage("assets/images/main_ph.png"),
                          radius: 40,
                        ),),
                    ),
                  ),
                ),
                // 5
                GestureDetector(
                  onTap: (){
                    print("open success fully screen");
                    // feal
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProfileScreen()),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 15),
                    child: ClipOval(
                      child: Container(width: 80,height: 80,decoration: BoxDecoration(border: Border.all(color: Colors.blue,width: 3),borderRadius: BorderRadius.circular(50)),
                        child: CircleAvatar(
                          backgroundImage: AssetImage("assets/images/mane_ig.png"),
                          radius: 40,
                        ),),
                    ),
                  ),
                ),
                // 6
                GestureDetector(
                  onTap: (){
                    print("open success fully screen");
                    // feal
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProfileScreen()),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 15),
                    child: ClipOval(
                      child: Container(width: 80,height: 80,decoration: BoxDecoration(border: Border.all(color: Colors.blue,width: 3),borderRadius: BorderRadius.circular(50)),
                        child: CircleAvatar(
                          backgroundImage: AssetImage("assets/images/main_ph.png"),
                          radius: 40,
                        ),),
                    ),
                  ),
                ),
               // Center(child: Text(arrText[2],style: TextStyle(color: colWt)),),
              ],
                        ),
            ),
         SizedBox(height: 15,),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            height: 300,
            width: double.infinity,
            child: Image.asset("assets/images/home_ig.png",fit: BoxFit.cover,),
          ),
          SizedBox(height: 15,),
          Row(
            children: [
              // Like icon with margin left 20
              Container(
                margin: EdgeInsets.only(left: 20),
                child: Icon(
                  Icons.favorite,
                  size: 30,
                  color: Colors.black,
                ),
              ),
              // Comment icon with margin left 20
              Container(
                margin: EdgeInsets.only(left: 20),
                child: Icon(
                  Icons.comment,
                  size: 30,
                  color: Colors.black,
                ),







              ),

              Container(
                margin: EdgeInsets.only(left: 20),
                child: Icon(
                  Icons.screen_share,
                  size: 30,
                  color: Colors.black,
                ),
              ),

              // Share icon with margin left 20 and right
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: 260),
                  child: Icon(
                    Icons.ad_units_sharp,
                    size: 25,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
      // second
          SizedBox(height: 15,),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            height: 300,
            width: double.infinity,
            child: Image.asset("assets/images/main_ph.png",fit: BoxFit.cover,),
          ),
          SizedBox(height: 15,),
          Row(
            children: [
              // Like icon with margin left 20
              Container(
                margin: EdgeInsets.only(left: 20),
                child: Icon(
                  Icons.favorite,
                  size: 30,
                  color: Colors.black,
                ),
              ),
              // Comment icon with margin left 20
              Container(
                margin: EdgeInsets.only(left: 20),
                child: Icon(
                  Icons.comment,
                  size: 30,
                  color: Colors.black,
                ),
              ),

              Container(
                margin: EdgeInsets.only(left: 20),
                child: Icon(
                  Icons.screen_share,
                  size: 30,
                  color: Colors.black,
                ),
              ),

              // Share icon with margin left 20 and right
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: 260),
                  child: Icon(
                    Icons.ad_units_sharp,
                    size: 25,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),






        ],
      ),
    );


  }
}

class LikeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Like Screen'),
    );
  }
}

class ShareScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 15,),
        Container(
          width: double.infinity,
          height: 80,
          margin: EdgeInsets.only(top: 10), // Add a top margin of 10 pixels
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(20),
              bottomLeft: Radius.circular(20),
            ),
            color: Colors.yellow,
          ),

          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(top: 40,left: 20),
                child: Text(
                  'Comment',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),

              Container(
                  margin: EdgeInsets.only(top: 40,left: 20),
                  height: 25,
                  width: 25,
                  child: Image.asset("assets/images/comment_circle.png")),

            ],
          ),
        ),
// 1
        SizedBox(height: 15,),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            border: Border.all(width: 1,color: Colors.black),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(

                  child: ClipOval(
                    child: Container(width: 80,height: 80,decoration: BoxDecoration(border: Border.all(color: Colors.blue,width: 3),borderRadius: BorderRadius.circular(50)),
                      child: CircleAvatar(
                        backgroundImage: AssetImage("assets/images/mane_ig.png"),
                        radius: 40,
                      ),),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Container(margin: const EdgeInsets.only(left: 5),child: Row(
                      children: [

                        Text("ronaldferguson",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),),
                        //  Container(color: Colors.blue,margin: EdgeInsets.only(left: 30,bottom: 10),child: Text(".",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.black),)),
                        Container(margin: EdgeInsets.only(left: 0,),child: Text("..5min ago",overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal,color: Colors.black),)),


                      ],
                    )),


                    Container(margin: EdgeInsets.only(left: 5),child: Text("Lorem ipsum is simply dummy...",overflow: TextOverflow.ellipsis,)),
                    Container(margin: EdgeInsets.only(left: 5),child: Text("printing send industry Lorem....",overflow: TextOverflow.ellipsis,)),
                    //  next of the,typesing  ipsum
                  ],
                ),
              ],
            ),
          ),

        ),
// 2
        SizedBox(height: 15,),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            border: Border.all(width: 1,color: Colors.black),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
//photo add
                  child: ClipOval(
                    child: Container(width: 80,height: 80,decoration: BoxDecoration(border: Border.all(color: Colors.blue,width: 3),borderRadius: BorderRadius.circular(50)),
                      child: CircleAvatar(
                        backgroundImage: AssetImage("assets/images/main_ph.png"),
                        radius: 40,
                      ),),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Container(margin: const EdgeInsets.only(left: 5),child: Row(
                      children: [
                        Text("ronaldferguson",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),),
                        //  Container(color: Colors.blue,margin: EdgeInsets.only(left: 30,bottom: 10),child: Text(".",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.black),)),
                        Container(margin: EdgeInsets.only(left: 0,),child: Text("..5min ago",style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal,color: Colors.black),)),
                      ],
                    )),


                    Container(margin: EdgeInsets.only(left: 5),child: Text("Lorem ipsum is simply dummy...",overflow: TextOverflow.ellipsis,)),
                    Container(margin: EdgeInsets.only(left: 5),child: Text("printing send typesing industry....",overflow: TextOverflow.ellipsis,)),
                  ],
                ),
              ],
            ),
          ),

        ),
// 3
        SizedBox(height: 15,),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            border: Border.all(width: 1,color: Colors.black),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(

                  child: ClipOval(
                    child: Container(width: 80,height: 80,decoration: BoxDecoration(border: Border.all(color: Colors.blue,width: 3),borderRadius: BorderRadius.circular(50)),
                      child: CircleAvatar(
                        backgroundImage: AssetImage("assets/images/mane_ig.png"),
                        radius: 40,
                      ),),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Container(margin: const EdgeInsets.only(left: 5),child: Row(
                      children: [
                        Text("ronaldferguson",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),),
                        //  Container(color: Colors.blue,margin: EdgeInsets.only(left: 30,bottom: 10),child: Text(".",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.black),)),
                        Container(margin: EdgeInsets.only(left: 0,),child: Text("..5min ago",style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal,color: Colors.black),)),
                      ],
                    )),

                    Container(margin: EdgeInsets.only(left: 5),child: Text("Lorem ipsum is simply dummy...",overflow: TextOverflow.ellipsis,)),
                    Container(margin: EdgeInsets.only(left: 5),child: Text("printing send typesing industry...",overflow: TextOverflow.ellipsis,)),
                  ],
                ),
              ],
            ),
          ),

        ),
      ],
    );
  }
}

class CommentScreen extends StatefulWidget {


  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue,title: Center(child: Text('Profile Screen',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),))),

      body:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 10,),
          FutureBuilder<List<MyData>>(
            future: DatabaseHelper.instance.getData(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                print("List view Builder loader");
                return Center(child: CircularProgressIndicator());
              }
              return Expanded(
                child: ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    print("List view Builder");

                    return GestureDetector(
                      onTap: (){
                        print("button");
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProfileScreen(
                              data: snapshot.data![index],
                            ),
                          ),
                        );

                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: 20,left: 20,right: 20),
                        decoration: BoxDecoration(
                          border: Border.all(width: 2, color: Colors.black),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ListTile(
                          leading: Container(
                            child: ClipOval(
                              child: Container(width: 60,height: 60,decoration: BoxDecoration(border: Border.all(color: Colors.black,width: 3),borderRadius: BorderRadius.circular(50)),
                                child: CircleAvatar(
                                  backgroundImage: AssetImage("assets/images/mane_ig.png"),
                                  radius: 70,
                                ),),
                            ),
                          ),
                          title: Text(snapshot.data![index].field1),
                          subtitle: Text(snapshot.data![index].field2),
                          // trailing: Text(snapshot.data![index].field3),
                        ),
                      ),
                    );

                  },
                ),
              );
            },
          ),

        ],
      ),

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
  @override
  Widget build(BuildContext context) {

    List<File> _selectedImages = [];
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

    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.lightBlue,title: Center(child: Text('Detail Screen',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),))),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [


             SizedBox(height: 20,),
             Center(
               child: Container(
                margin: EdgeInsets.only(left: 15),
                child: ClipOval(
                  child: Container(width: 80,height: 80,decoration: BoxDecoration(border: Border.all(color: Colors.blue,width: 3),borderRadius: BorderRadius.circular(50)),
                    child: CircleAvatar(
                      backgroundImage: AssetImage("assets/images/mane_ig.png"),
                      radius: 40,
                    ),),
                ),
                           ),
             ),
            SizedBox(height: 20,),

            Text("UserName: ${widget.data?.field1}"),
            Text("Email: ${widget.data?.field2}"),
            // Add more widgets to display additional details if needed
// Following and Message
//           SizedBox(height: 10,),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//                 Container(
//                   decoration: BoxDecoration(
//                     border: Border.all(width: 1,color: Colors.black),
//                   ),
//                   child: Center(child: Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
//                     child: Container(margin: EdgeInsets.symmetric(horizontal: 50),child: Text("Following")),
//                   )),
//                 ),
//
//               Container(
//                 decoration: BoxDecoration(
//                   border: Border.all(width: 1,color: Colors.black),
//                 ),
//                 child: Center(child: Padding(
//                   padding: const EdgeInsets.all(5.0),
//                   child: Container(margin: EdgeInsets.symmetric(horizontal: 50),child: Text("Message")),
//                 )),
//               ),
//             ],
//           ),

// Icons two
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              
              children: [
           
                GestureDetector(onTap: (){
                  _pickImage();
                  print("success fully");
                },child: Container(margin: EdgeInsets.symmetric(horizontal: 50,vertical: 15),child: Icon(Icons.add_box,size: 40,),),),



                Container(margin: EdgeInsets.symmetric(horizontal: 50),child: Icon(Icons.smart_display_outlined,size: 40,)),

                
                
                
                
              ],
            ),
            Container(color: Colors.black,height: 0.5,),

                     
                        Expanded(
                          child: GridView.builder(
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, // Adjust the number of images per row
                              mainAxisSpacing: 4.0, // Adjust the spacing between images vertically
                              crossAxisSpacing: 4.0, // Adjust the spacing between images horizontally
                            ),
                            itemCount: _selectedImages.length,
                            itemBuilder: (context, index) {
                              print("image length index value: ${ _selectedImages.length}");
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(width: 2, color: Colors.black),
                                  ),
                                  width: 200, // Adjust the width of the image container
                                  height: 400, // Adjust the height of the image container
                                  child: Image.file(
                                    _selectedImages[index],
                                    fit: BoxFit.cover, // Adjust the fit of the image within the container
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                     
                     
                        SizedBox(height: 20),
                        // IconButton(
                        //   icon: Icon(Icons.photo_library),
                        //   onPressed: _pickImage,
                        // ),
                     
                     
                     






















          ],
        ),
      ),
    );
  }


}





// Details Screen
class DetailsScreen extends StatelessWidget {
  MyData data;

  DetailsScreen({required this.data});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.lightBlue,title: Center(child: Text('Detail Screen',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),))),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            GestureDetector(
              onTap: (){
                print("open success fully screen");
                // feal
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => ProfileScreen()),
                // );
              },
              child: Center(
                child: Container(
                  margin: EdgeInsets.only(left: 15),
                  child: ClipOval(
                    child: Container(width: 80,height: 80,decoration: BoxDecoration(border: Border.all(color: Colors.blue,width: 3),borderRadius: BorderRadius.circular(50)),
                      child: CircleAvatar(
                        backgroundImage: AssetImage("assets/images/mane_ig.png"),
                        radius: 40,
                      ),),
                  ),
                ),
              ),
            ),



            Text("UserName: ${data.field1}"),
            Text("Email: ${data.field2}"),
            // Add more widgets to display additional details if needed


          ],
        ),
      ),
    );
  }
}


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
