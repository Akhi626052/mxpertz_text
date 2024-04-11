// import 'package:flutter/material.dart';
// void main() {
//   runApp(MaterialApp(
//     home: ProfileScreen(),
//   ));
// }
// //
//
// class ProfileScreen extends StatefulWidget {
//   @override
//   _ProfileScreenState createState() => _ProfileScreenState();
// }
//
// class _ProfileScreenState extends State<ProfileScreen> {
//
//   TextEditingController _usernameController = TextEditingController();
//   TextEditingController _emailController = TextEditingController();
//   TextEditingController _passwordController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Profile'),
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(20.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Center(
//               child: CircleAvatar(
//                 radius: 50,
//                 backgroundImage: AssetImage(
//                     'assets/profile_image.jpg'), // Placeholder image
//               ),
//             ),
//             SizedBox(height: 20),
//             Text(
//               'Username',
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//             ),
//             TextFormField(
//               controller: _usernameController,
//               decoration: InputDecoration(
//                 hintText: 'Enter your username',
//               ),
//             ),
//             SizedBox(height: 20),
//             Text(
//               'Email',
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//             ),
//             TextFormField(
//               controller: _emailController,
//               decoration: InputDecoration(
//                 hintText: 'Enter your email',
//               ),
//             ),
//             SizedBox(height: 20),
//             Text(
//               'Password',
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//             ),
//             TextFormField(
//               controller: _passwordController,
//               obscureText: true,
//               decoration: InputDecoration(
//                 hintText: 'Enter your password',
//               ),
//             ),
//             SizedBox(height: 20),
//             Center(
//               child: ElevatedButton(
//                 onPressed: () {
//                   // Handle save button press
//                   _saveProfile(context);
//                 },
//                 child: Text('Save'),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//
//   void _saveProfile(BuildContext context) {
//     // Save profile logic here
//     String username = _usernameController.text;
//     String email = _emailController.text;
//     String password = _passwordController.text;
//
//     // Navigate to second screen and pass the entered information
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) =>
//             ProfileInfoScreen(
//               username: username,
//               email: email,
//               password: password,
//             ),
//       ),
//     );
//   }
//
//
// }
//
// class ProfileInfoScreen extends StatelessWidget {
//   final String username;
//   final String email;
//   final String password;
//
//   ProfileInfoScreen({required this.username, required this.email, required this.password});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Profile Information'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(20.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Username: $username',
//               style: TextStyle(fontSize: 16),
//             ),
//             SizedBox(height: 10),
//             Text(
//               'Email: $email',
//               style: TextStyle(fontSize: 16),
//             ),
//             SizedBox(height: 10),
//             Text(
//               'Password: $password',
//               style: TextStyle(fontSize: 16),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// // class ProfileScreen extends StatefulWidget {
// //   @override
// //   _ProfileScreenState createState() => _ProfileScreenState();
// // }
// //
// // class _ProfileScreenState extends State<ProfileScreen> {
// //   TextEditingController _usernameController = TextEditingController();
// //   TextEditingController _emailController = TextEditingController();
// //   TextEditingController _passwordController = TextEditingController();
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Profile'),
// //       ),
// //       body: SingleChildScrollView(
// //         padding: EdgeInsets.all(20.0),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             Center(
// //               child: CircleAvatar(
// //                 radius: 50,
// //                 backgroundImage: AssetImage('assets/profile_image.jpg'), // Placeholder image
// //               ),
// //             ),
// //             SizedBox(height: 20),
// //             Text(
// //               'Username',
// //               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
// //             ),
// //             TextFormField(
// //               controller: _usernameController,
// //               decoration: InputDecoration(
// //                 hintText: 'Enter your username',
// //               ),
// //             ),
// //             SizedBox(height: 20),
// //             Text(
// //               'Email',
// //               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
// //             ),
// //             TextFormField(
// //               controller: _emailController,
// //               decoration: InputDecoration(
// //                 hintText: 'Enter your email',
// //               ),
// //             ),
// //             SizedBox(height: 20),
// //             Text(
// //               'Password',
// //               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
// //             ),
// //             TextFormField(
// //               controller: _passwordController,
// //               obscureText: true,
// //               decoration: InputDecoration(
// //                 hintText: 'Enter your password',
// //               ),
// //             ),
// //             SizedBox(height: 20),
// //             Center(
// //               child: ElevatedButton(
// //                 onPressed: () {
// //                   // Handle save button press
// //                   _saveProfile();
// //                 },
// //                 child: Text('Save'),
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// //
// //   void _saveProfile() {
// //     // Save profile logic here
// //     String username = _usernameController.text;
// //     String email = _emailController.text;
// //     String password = _passwordController.text;
// //
// //     // You can add validation and save logic here
// //     print('Username: $username');
// //     print('Email: $email');
// //     print('Password: $password');
// //   }
// // }
//
//
