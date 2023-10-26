// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firestore_search/firestore_search.dart';
// import 'package:flutter/material.dart';
//
// class Search_bar extends StatefulWidget {
//   const Search_bar({Key? key}) : super(key: key);
//
//   @override
//   State<Search_bar> createState() => _Search_barState();
// }
//
// class _Search_barState extends State<Search_bar> {
//   @override
//   Widget build(BuildContext context) {
//     return FirestoreSearchResults.builder(
//       tag: 'example',
//       firestoreCollectionName: 'jknj',
//       searchBy: 'testname',
//       initialBody: const Center(
//         child: Text('Initial body'),
//       ),
//       dataListFromSnapshot: DataModel().dataListFromSnapshot,
//       builder: (context, snapshot) {
//         if (snapshot.hasData) {
//           final List<DataModel>? dataList = snapshot.data;
//           if (dataList!.isEmpty) {
//             return const Center(
//               child: Text('No Results Returned'),
//             );
//           }
//           return ListView.builder(
//               itemCount: dataList.length,
//               itemBuilder: (context, index) {
//                 final DataModel data = dataList[index];
//
//                 return Column(
//                   mainAxisSize: MainAxisSize.min,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Text(
//                         '${data.name}',
//                         style: Theme.of(context).textTheme.headline6,
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(
//                           bottom: 8.0, left: 8.0, right: 8.0),
//                       child: Text('${data.developer}',
//                           style: Theme.of(context).textTheme.bodyText1),
//                     )
//                   ],
//                 );
//               });
//         }
//
//         if (snapshot.connectionState == ConnectionState.done) {
//           if (!snapshot.hasData) {
//             return const Center(
//               child: Text('No Results Returned'),
//             );
//           }
//         }
//         return const Center(
//           child: CircularProgressIndicator(),
//         );
//       },
//     );
//   }
// }
//
// class DataModel {
//   final String? name;
//   final String? developer;
//   final String? framework;
//   final String? tool;
//
//   DataModel({this.name, this.developer, this.framework, this.tool});
//
//   //Create a method to convert QuerySnapshot from Cloud Firestore to a list of objects of this DataModel
//   //This function in essential to the working of FirestoreSearchScaffold
//
//   List<DataModel> dataListFromSnapshot(QuerySnapshot querySnapshot) {
//     return querySnapshot.docs.map((snapshot) {
//       final Map<String, dynamic> dataMap =
//           snapshot.data() as Map<String, dynamic>;
//
//       return DataModel(
//           name: dataMap['testname'],
//           developer: dataMap['parameters'],
//           framework: dataMap['reporttime'],
//           tool: dataMap['prepration']);
//     }).toList();
//   }
// }
