import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  final String userId;

  CartScreen({required this.userId});

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<CartProduct> _cartData = [];

  @override
  void initState() {
    super.initState();
    _getCartData();
  }

  Future<void> _getCartData() async {
    List<CartProduct> cartData = [];
    var querySnapshot = await FirebaseFirestore.instance
        .collection('cart')
        .where('userId', isEqualTo: widget.userId)
        .get();
    for (var document in querySnapshot.docs) {
      var productSnapshot = await FirebaseFirestore.instance
          .collection('products')
          .doc(document['productId'])
          .get();
      var cartProduct = CartProduct(
        id: document.id,
        userId: document['userId'],
        productId: document['productId'],
        quantity: document['quantity'],
        product: Product(
          id: productSnapshot.id,
          name: productSnapshot['name'],
          imageUrl: productSnapshot['imageUrl'],
          price: productSnapshot['price'],
        ),
      );
      cartData.add(cartProduct);
    }
    setState(() {
      _cartData = cartData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: _cartData.isNotEmpty
          ? ListView.builder(
              itemCount: _cartData.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: Image.network(_cartData[index].product.imageUrl),
                  title: Text(_cartData[index].product.name),
                  subtitle: Text('Quantity: ${_cartData[index].quantity}'),
                );
              },
            )
          : Center(
              child: Text('Your cart is empty.'),
            ),
    );
  }
}

class Product {
  final String id;
  final String name;
  final String imageUrl;
  final double price;

  Product({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
  });
}

class CartProduct {
  final String id;
  final String userId;
  final String productId;
  final int quantity;
  final Product product;

  CartProduct({
    required this.id,
    required this.userId,
    required this.productId,
    required this.quantity,
    required this.product,
  });
}
