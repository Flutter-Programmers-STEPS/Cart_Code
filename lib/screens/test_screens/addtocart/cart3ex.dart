import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CartScreenGPT extends StatefulWidget {
  final List<String> cartItems;

  CartScreenGPT({required this.cartItems});

  @override
  _CartScreenGPTState createState() => _CartScreenGPTState();
}

class _CartScreenGPTState extends State<CartScreenGPT> {
  List<Map<String, dynamic>> _testDetails = [];

  @override
  void initState() {
    super.initState();
    _getTestDetails();
  }

  void _getTestDetails() async {
    for (String productId in widget.cartItems) {
      DocumentSnapshot testSnapshot = await FirebaseFirestore.instance
          .collection('jknj')
          .doc(productId)
          .get();
      if (testSnapshot.exists) {
        Map<String, dynamic> testDetails =
            testSnapshot.data()! as Map<String, dynamic>;
        testDetails['productId'] = productId;
        _testDetails.add(testDetails);
      } else {
        print('Test not found in database!');
      }
    }
    setState(() {});
  }

  void _removeTestFromCart(String productId) {
    setState(() {
      widget.cartItems.remove(productId);
      _testDetails.removeWhere((test) => test['productId'] == productId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Cart'),
      ),
      body: _testDetails.isEmpty
          ? Center(
              child: Text('Your cart is empty!'),
            )
          : ListView.builder(
              itemCount: _testDetails.length,
              itemBuilder: (BuildContext context, int index) {
                Map<String, dynamic> test = _testDetails[index];
                return ListTile(
                  title: Text(test['testname']),
                  subtitle: Text(test['parameters']),
                  trailing: Text('\$${test['price']}'),
                  onTap: () {},
                  leading: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () => _removeTestFromCart(test['productId']),
                  ),
                );
              },
            ),
    );
  }
}
