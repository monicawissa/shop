import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/ui/screens/add_product.dart';
import 'package:shop/ui/screens/modify_product.dart';
import 'package:shop/ui/screens/product_details.dart';
import 'package:shop/ui/screens/product_screen.dart';

import 'constant.dart';
import 'data_layer/product_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProductData(),
      child: MaterialApp(
        theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: kprimaryColor,
            primaryColor: kprimaryColor),
        initialRoute: '/',
        routes: {
          ProductsScreen.id: (context) => ProductsScreen(),
          AddProduct.id: (context) => AddProduct(),
          // ModifyProduct.id: (context) => ModifyProduct(),
          // ProductDetails.id: (context) => ProductDetails()
        },
      ),
    );
  }
}
