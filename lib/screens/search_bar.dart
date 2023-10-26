import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage();

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController editingController = TextEditingController();

  final duplicateItems = List<String>.generate(10000, (i) => "Item $i");
  var items = <String>[];

  @override
  void initState() {
    items.addAll(duplicateItems);
    super.initState();
  }

  void filterSearchResults(String query) {
    List<String> dummySearchList = <String>[];
    dummySearchList.addAll(duplicateItems);
    if (query.isNotEmpty) {
      List<String> dummyListData = <String>[];
      dummySearchList.forEach((item) {
        if (item.contains(query)) {
          dummyListData.add(item);
        }
      });
      setState(() {
        items.clear();
        items.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        items.clear();
        items.addAll(duplicateItems);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('text'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) {
                  filterSearchResults(value);
                },
                controller: editingController,
                decoration: InputDecoration(
                    labelText: "Search",
                    hintText: "Search",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25.0)))),
              ),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('${items[index]}'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
//
// class SearchBarWithSuggestions extends StatefulWidget {
//   final Function(String) onSuggestionTap;
//
//   SearchBarWithSuggestions({required this.onSuggestionTap});
//
//   @override
//   _SearchBarWithSuggestionsState createState() =>
//       _SearchBarWithSuggestionsState();
// }
//
// class _SearchBarWithSuggestionsState extends State<SearchBarWithSuggestions> {
//   TextEditingController _searchController = TextEditingController();
//   List<String> _suggestions = ['apple', 'banana', 'cherry', 'durian'];
//   List<String> _filteredSuggestions = [];
//
//   @override
//   void initState() {
//     super.initState();
//     _filteredSuggestions = _suggestions;
//   }
//
//   void _filterSuggestions(String query) {
//     setState(() {
//       _filteredSuggestions = _suggestions
//           .where((suggestion) =>
//               suggestion.toLowerCase().contains(query.toLowerCase()))
//           .toList();
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Container(
//             padding: EdgeInsets.all(8),
//             child: TextField(
//               controller: _searchController,
//               decoration: InputDecoration(
//                 hintText: 'Search...',
//                 suffixIcon: Icon(Icons.search),
//                 border: OutlineInputBorder(),
//               ),
//               onChanged: _filterSuggestions,
//             ),
//           ),
//           Expanded(
//             child: ListView.builder(
//               itemCount: _filteredSuggestions.length,
//               itemBuilder: (BuildContext context, int index) {
//                 final suggestion = _filteredSuggestions[index];
//                 return ListTile(
//                   title: Text(suggestion),
//                   onTap: () => widget.onSuggestionTap(suggestion),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
//
// class SearchBarWithSuggestions extends StatefulWidget {
//   @override
//   _SearchBarWithSuggestionsState createState() =>
//       _SearchBarWithSuggestionsState();
// }
//
// class _SearchBarWithSuggestionsState extends State<SearchBarWithSuggestions> {
//   TextEditingController _searchController = TextEditingController();
//   List<String> _suggestions = ['apple', 'banana', 'cherry', 'durian'];
//   List<String> _filteredSuggestions = [];
//
//   @override
//   void initState() {
//     super.initState();
//     _filteredSuggestions = _suggestions;
//   }
//
//   void _filterSuggestions(String query) {
//     setState(() {
//       _filteredSuggestions = _suggestions
//           .where((suggestion) =>
//               suggestion.toLowerCase().contains(query.toLowerCase()))
//           .toList();
//     });
//   }
//
//   void _onSuggestionTap(String suggestion) {
//     print('Suggestion tapped: $suggestion');
//     // Do something with the suggestion, such as navigate to a new page
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Column(
//           children: [
//             Container(
//               padding: EdgeInsets.all(8),
//               child: TextField(
//                 controller: _searchController,
//                 decoration: InputDecoration(
//                   hintText: 'Search...',
//                   suffixIcon: Icon(Icons.search),
//                   border: OutlineInputBorder(),
//                 ),
//                 onChanged: _filterSuggestions,
//               ),
//             ),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: _filteredSuggestions.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   final suggestion = _filteredSuggestions[index];
//                   return ListTile(
//                     title: Text(suggestion),
//                     onTap: () => _onSuggestionTap(suggestion),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
