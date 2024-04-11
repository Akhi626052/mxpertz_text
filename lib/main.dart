import 'package:flutter/material.dart';
import 'package:mxpertz_text/screen/login_screen.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false,home: LoginScreen(),));
}
class LoginScreenss extends StatefulWidget {
  const LoginScreenss({super.key});

  @override
  State<LoginScreenss> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreenss> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(),
    );
  }
}



