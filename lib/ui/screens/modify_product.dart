import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/item.dart';

class ModifyProduct extends StatefulWidget {
  static String id = '/modifyProduct';
  final ItemModel product;

  ModifyProduct({@required this.product});

  @override
  _ModifyProductState createState() => _ModifyProductState();
}

class _ModifyProductState extends State<ModifyProduct> {
  final _formKey = GlobalKey<FormState>();

  String productType;

  String title;

  String price;

  @override
  Widget build(BuildContext context) {}
}
