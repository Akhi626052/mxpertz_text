import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: ListCommentScreen(),
  ));
}

class ListCommentScreen extends StatefulWidget {
  const ListCommentScreen({super.key});

  @override
  State<ListCommentScreen> createState() => _ListCommentScreenState();
}

class _ListCommentScreenState extends State<ListCommentScreen> {
  List<List<String>> commentsList = [];
  String commentInput = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          GestureDetector(
            onTap: () {
              print("clickable button");
              _settingModalBottomSheet(context);
            },
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Icon(Icons.comment),
            ),
          ),
        ],
      ),
    );
  }

  void _settingModalBottomSheet(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: commentsList.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text("Comment ${index + 1}"),
                        subtitle: commentsList.isNotEmpty &&
                            commentsList.length > index
                            ? Text(commentsList[index].join('\n'))
                            : Text("No comments yet"),
                      );
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(8.0),
                  color: Colors.grey[200],
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          onChanged: (value) {
                            setState(() {
                              commentInput = value;
                            });
                          },
                          decoration: InputDecoration(
                            hintText: 'Write a comment...',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.send),
                        onPressed: () {
                          print("Send button tapped");
                          if (commentInput.isNotEmpty) {
                            setState(() {
                              commentsList.add([commentInput]);
                              commentInput = ''; // Clear the TextField
                            });
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
