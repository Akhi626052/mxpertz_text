import 'package:flutter/material.dart';

import '../bottom_navigation_screen.dart';

// void main() {
//   runApp(MyApp());
// }
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: RegisterScreen(),
//     );
//   }
// }





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

    // Navigate to second screen and pass the entered information
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            ProfileScreen(
              username: username,
              email: email,
              password: password,
            ),
      ),
    );
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
              onTap: () {
                // Handle register button tap
                print('Register button tapped');
                // value send
                _saveProfile(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BottomNavigationDemo()),
                );
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
    );
  }
}
