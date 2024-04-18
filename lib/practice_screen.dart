import 'dart:html';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class ProfileScreen extends StatefulWidget {
  // MyData? data;
  // ProfileScreen({this.data});

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

            // Text("UserName: ${widget.data?.field1}"),
            // Text("Email: ${widget.data?.field2}"),
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


























          ],
        ),
      ),
    );
  }


}