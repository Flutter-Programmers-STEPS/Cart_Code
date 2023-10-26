// import 'package:flutter/material.dart';
//
// import '../authentication/googleee.dart';
// import 'login_page.dart';
//
// class Profile_Page extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topRight,
//             end: Alignment.bottomLeft,
//             colors: [Colors.blue, Colors.grey],
//           ),
//         ),
//         child: Center(child: Text("Home")),
//       ),
//       drawer: Drawer(
//         child: Column(
//           children: <Widget>[
//             DrawerHeader(
//               child: CircleAvatar(
//                 backgroundImage: NetworkImage(
//                   imageUrl!,
//                 ),
//                 radius: 100,
//                 backgroundColor: Colors.transparent,
//               ),
//             ),
//             ListTile(
//               title: Text(
//                 'NAME',
//                 style: TextStyle(
//                     fontWeight: FontWeight.bold, color: Colors.black54),
//               ),
//               subtitle: Text(
//                 name!,
//                 style: TextStyle(color: Colors.deepPurple),
//               ),
//             ),
//             ListTile(
//               subtitle: Text(
//                 email!,
//                 style: TextStyle(
//                   color: Colors.deepPurple,
//                 ),
//               ),
//               title: Text(
//                 'EMAIL',
//                 style: TextStyle(
//                     fontSize: 15,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black54),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Divider(),
//             ),
//             ListTile(
//               onTap: () {
//                 signOutGoogle();
//                 Navigator.of(context).pushAndRemoveUntil(
//                     MaterialPageRoute(builder: (context) {
//                   return LoginPage();
//                 }), ModalRoute.withName('/'));
//               },
//               title: Text(
//                 'Sign Out',
//                 style: TextStyle(color: Colors.black),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
