import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: SignupScreen(),
//     );
//   }
// }

class SignupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/login_bg.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Container at the center
          Center(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.only(top: 40,bottom: 40,left: 20,right: 20),
              decoration: BoxDecoration(
                //color: Colors.black.withOpacity(0.6),
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Sign in to Your account',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 50),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: Colors.yellow, // Set border color here
                          width: 2.0, // Set border width here
                        ),
                      ),
                      enabledBorder: OutlineInputBorder( // To remove the default border color
                        borderSide: BorderSide(
                          color: Colors.yellow, // Set border color here
                          width: 2.0, // Set border width here
                        ),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.yellow, // Set border color here
                          width: 2.0, // Set border width here
                        ),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      hintText: 'Email',
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.5),
                    ),
                    style: TextStyle(color: Colors.black), // Set text color to black
                    cursorColor: Colors.yellow,
                  ),

                  SizedBox(height: 30),
                  TextField(
                    cursorColor: Colors.yellow,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: Colors.yellow, // Set border color here
                          width: 2.0, // Set border width here
                        ),
                      ),
                      enabledBorder: OutlineInputBorder( // To remove the default border color
                        borderSide: BorderSide(
                          color: Colors.yellow, // Set border color here
                          width: 2.0, // Set border width here
                        ),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.yellow, // Set border color here
                          width: 2.0, // Set border width here
                        ),
                        borderRadius: BorderRadius.circular(5.0),
                      ),

                      hintText: 'Password',
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.5),
                    ),
                    style: TextStyle(color: Colors.white),
                    obscureText: true,
                  ),





                  SizedBox(height: 40),
                  GestureDetector(
                    onTap: () {
                      // Handle login button tap
                      print('Log In button tapped');
                    },
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(vertical: 15),
                      decoration: BoxDecoration(
                        color: Color(0xff011D45),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Text(
                          'Log In',
                          style: TextStyle(
                            color: Colors.yellow,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  GestureDetector(
                    onTap: () {
                      // Handle forget password tap
                      print('Forget Password tapped');
                    },
                    child: Text(
                      'FORGET PASSWORD',
                      style: TextStyle(
                        color: Colors.black,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
