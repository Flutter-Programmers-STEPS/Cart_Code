import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProductDetailScreen extends StatefulWidget {
  final String productId;

  const ProductDetailScreen({Key? key, required this.productId})
      : super(key: key);

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int _quantity = 1;

  void _addToCart() {
    FirebaseFirestore.instance
        .collection('addtocart')
        .add({'productId': widget.productId, 'quantity': _quantity});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Detail'),
      ),
      body: Column(
        children: [
          Text('Product ID: ${widget.productId}'),
          Row(
            children: [
              Text('Quantity: $_quantity'),
              IconButton(
                onPressed: () => setState(() => _quantity++),
                icon: Icon(Icons.add),
              ),
              IconButton(
                onPressed: () => setState(() => _quantity--),
                icon: Icon(Icons.remove),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: _addToCart,
            child: Text('Add to Cart'),
          ),
        ],
      ),
    );
  }
}
