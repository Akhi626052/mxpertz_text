import 'package:flutter/material.dart';

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
      home: BottomNavigationDemo(),
    );
  }
}

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
    ProfileScreen(username: '', email: '', password: '',),
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
              // First item: Rounded shape plush Image
              Container(
                width: 100,
                height: 100,
                child: Icon(
                  Icons.add_circle_outline,
                  size: 40,
                  color: Colors.black,
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
            Row(
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
                    MaterialPageRoute(builder: (context) => ProfileScreen(username: "", email: '', password: '',)),
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
              Container(
                margin: EdgeInsets.only(left: 15),
                child: ClipOval(
                  child: Container(width: 80,height: 80,decoration: BoxDecoration(border: Border.all(color: Colors.blue,width: 3),borderRadius: BorderRadius.circular(50)),
                    child: CircleAvatar(
                      backgroundImage: AssetImage("assets/images/mane_ig.png"),
                      radius: 40,
                    ),),
                ),
              ),
       // 3
              Container(
                margin: EdgeInsets.only(left: 15),
                child: ClipOval(
                  child: Container(width: 80,height: 80,decoration: BoxDecoration(border: Border.all(color: Colors.blue,width: 3),borderRadius: BorderRadius.circular(50)),
                    child: CircleAvatar(
                      backgroundImage: AssetImage("assets/images/mane_ig.png"),
                      radius: 40,
                    ),),
                ),
              ),
      
      
      
      
             // Center(child: Text(arrText[2],style: TextStyle(color: colWt)),),
            ],
          ),
         SizedBox(height: 15,),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            height: 300,
            width: double.infinity,
            child: Image.asset("assets/images/home_ig.png"),
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
            child: Image.asset("assets/images/home_ig.png"),
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
    return Center(
      child: Text('Share Screen'),
    );
  }
}

class CommentScreen extends StatelessWidget {



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body:Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // comsc
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

                            Container(margin: const EdgeInsets.only(left: 20),child: Row(
                              children: [
                                Text("ronaldferguson",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),),
                               //  Container(color: Colors.blue,margin: EdgeInsets.only(left: 30,bottom: 10),child: Text(".",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.black),)),
                                 Container(margin: EdgeInsets.only(left: 45,),child: Text("..5min ago",style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal,color: Colors.black),)),
                              ],
                            )),


                      Container(margin: EdgeInsets.only(left: 20),child: Text("Lorem ipsum is simply dummy next of the ")),
                      Container(margin: EdgeInsets.only(left: 20),child: Text("printing send typesing industry Lorem ipsum")),
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

                      Container(margin: const EdgeInsets.only(left: 20),child: Row(
                        children: [
                          Text("ronaldferguson",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),),
                          //  Container(color: Colors.blue,margin: EdgeInsets.only(left: 30,bottom: 10),child: Text(".",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.black),)),
                          Container(margin: EdgeInsets.only(left: 45,),child: Text("..5min ago",style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal,color: Colors.black),)),
                        ],
                      )),


                      Container(margin: EdgeInsets.only(left: 20),child: Text("Lorem ipsum is simply dummy next of the ")),
                      Container(margin: EdgeInsets.only(left: 20),child: Text("printing send typesing industry Lorem ipsum")),
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

                      Container(margin: const EdgeInsets.only(left: 20),child: Row(
                        children: [
                          Text("ronaldferguson",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),),
                          //  Container(color: Colors.blue,margin: EdgeInsets.only(left: 30,bottom: 10),child: Text(".",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.black),)),
                          Container(margin: EdgeInsets.only(left: 45,),child: Text("..5min ago",style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal,color: Colors.black),)),
                        ],
                      )),


                      Container(margin: EdgeInsets.only(left: 20),child: Text("Lorem ipsum is simply dummy next of the ")),
                      Container(margin: EdgeInsets.only(left: 20),child: Text("printing send typesing industry Lorem ipsum")),
                    ],
                  ),
                ],
              ),
            ),

          ),











          // appBar: AppBar(
          //   title: Text(
          //     'Register with Skenu',
          //     style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
          //   ),
          //   backgroundColor: Colors.yellow,
          //   shape: RoundedRectangleBorder(
          //     borderRadius: BorderRadius.only(
          //       bottomLeft: Radius.circular(20),
          //       bottomRight: Radius.circular(20),
          //     ),
          //   ),
          //   centerTitle: true,
          //   toolbarHeight: 60, // Set the height of the AppBar to include top margin
          // ),

        ]
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {

  final String username;
  final String email;
  final String password;

  ProfileScreen({required this.username, required this.email, required this.password});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body:  Column(
       mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Center(
          //   child: Text('Profile Screen'),
          // ),
    Text(
    'Username: $this.username',
    style: TextStyle(fontSize: 16),
    ),
    SizedBox(height: 10),
    Text(
    'Email: $this.email',
    style: TextStyle(fontSize: 16),
    ),
    SizedBox(height: 10),
    Text(
    'Password: $this.password',
    style: TextStyle(fontSize: 16),
    ),















        ],
      ),
    );
  }
}