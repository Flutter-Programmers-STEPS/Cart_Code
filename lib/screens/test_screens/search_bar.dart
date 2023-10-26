// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// class SearchBarPage extends StatefulWidget {
//   @override
//   _SearchBarPageState createState() => _SearchBarPageState();
// }
//
// class _SearchBarPageState extends State<SearchBarPage> {
//   final TextEditingController _searchController = TextEditingController();
//   String _searchTerm = '';
//   late QuerySnapshot _searchResults;
//
//   @override
//   void dispose() {
//     _searchController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: TextField(
//           controller: _searchController,
//           decoration: InputDecoration(
//             hintText: 'Search...',
//             border: InputBorder.none,
//           ),
//           onChanged: (value) => setState(() => _searchTerm = value),
//           onSubmitted: _submitSearch,
//         ),
//       ),
//       body: _searchResults != null
//           ? ListView.builder(
//               itemCount: _searchResults.docs.length,
//               itemBuilder: (BuildContext context, int index) {
//                 DocumentSnapshot document = _searchResults.docs[index];
//                 return ListTile(
//                   title: Text(document['title']),
//                   subtitle: Text(document['description']),
//                 );
//               },
//             )
//           : Center(
//               child: Text('Enter a search term to begin'),
//             ),
//     );
//   }
//
//   void _submitSearch(String value) async {
//     setState(() {
//       _searchResults = null;
//     });
//
//     if (value.isEmpty) {
//       return;
//     }
//
//     QuerySnapshot snapshot = await FirebaseFirestore.instance
//         .collection('items')
//         .where('title', isEqualTo: value)
//         .get();
//
//     setState(() {
//       _searchResults = snapshot;
//     });
//   }
// }
