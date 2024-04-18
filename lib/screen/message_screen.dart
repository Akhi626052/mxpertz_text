import 'package:flutter/material.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: MessageScreen(),
      ),
    );
  }
}

class MessageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
       Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.yellow,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15),bottomRight: Radius.circular(15))
            ),

            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [

                  IconButton(
                    icon: Icon(Icons.arrow_back_ios_new,color: Colors.black,),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  SizedBox(width: 10),
                  Container(
                    margin: EdgeInsets.only(left: 15),
                    child: ClipOval(
                      child: Container(width: 60,height: 60,decoration: BoxDecoration(border: Border.all(color: Colors.black,width: 1),borderRadius: BorderRadius.circular(50)),
                        child: CircleAvatar(
                          backgroundImage: AssetImage("assets/images/mane_ig.png"),
                          radius: 40,
                        ),),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(top: 12,left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Text Column 2',
                            style:
                            TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 1),
                          Text(
                            'This is the content of text column 2.',
                            style: TextStyle(fontSize: 13),
                          ),




                        ],
                      ),
                    ),
                  ),



                ],
              ),
            ),
          ),

              SizedBox(width: 20),


        ],
      );
  }
}
