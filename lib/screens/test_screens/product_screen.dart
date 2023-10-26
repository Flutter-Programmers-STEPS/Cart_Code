import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;

class ProductScreen extends StatefulWidget {
  final DocumentSnapshot product;

  ProductScreen({required this.product});

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final CollectionReference test =
      FirebaseFirestore.instance.collection('products');

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference cartCollection =
      FirebaseFirestore.instance.collection('cart');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product['name']),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(widget.product['image_url']),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.product['name'],
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  widget.product['description'],
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "\$${widget.product['price']}",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              onPressed: () async {
                await cartCollection.add({
                  'name': widget.product['name'],
                  'price': widget.product['price'],
                  'description': widget.product['description'],
                  'image_url': widget.product['image_url'],
                  'category': widget.product['category'],
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Product added to cart!')),
                );
              },
              child: Text('Add to Cart'),
            ),
          ),
        ],
      ),
    );
  }
}
