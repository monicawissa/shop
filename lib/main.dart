import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/item.dart';
import 'package:shop/ui/screens/add_product.dart';
import 'package:shop/ui/screens/product_screen.dart';

import 'constant.dart';
import 'data_layer/firestore_service.dart';
import 'data_layer/product_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final firestoreService = FireStoreService();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: ProductProvider()),
        StreamProvider.value(value: firestoreService.getProducts()),
      ],
      child: MaterialApp(
        theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: kprimaryColor,
            primaryColor: kprimaryColor),
        initialRoute: '/',
        routes: {
          ProductsScreen.id: (context) => ProductsScreen(),
          AddProduct.id: (context) => AddProduct(),
        },
      ),
    );
  }
}
