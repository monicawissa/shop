import 'dart:ffi';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop/ui/screens/add_product.dart';
import 'package:shop/ui/widgets/products_list.dart';

import '../../constant.dart';

class ProductsScreen extends StatefulWidget {
  static String id = '/';
  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product App'),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: blue,
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.pushNamed(context, AddProduct.id);
          }),
      body: Container(
        decoration: BoxDecoration(
            color: kactiveCardColor,
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        child: ProductsList(),
      ),
    );
  }
}
