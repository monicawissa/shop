import 'package:flutter/material.dart';
import 'package:shop/data_layer/product_data.dart';
import 'package:shop/ui/screens/product_details.dart';
import 'package:provider/provider.dart';
import 'package:shop/ui/widgets/product_tile.dart';

class ProductsList extends StatefulWidget {
  @override
  _ProductsListState createState() => _ProductsListState();
}

class _ProductsListState extends State<ProductsList> {
  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return Consumer<ProductData>(
      builder: (context, productData, child) {
        return GridView.builder(
          itemBuilder: (context, index) {
            final product = productData.itemModel[index];
            return ProductTile(
              product: product,
              pressCallback: () {
                Navigator.pushNamed(context, ProductDetails.id);
              },
              longPressCallback: () {
                productData.deleteItemModel(product);
              },
            );
          },
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: (orientation == Orientation.portrait) ? 2 : 3),
          itemCount: productData.itemsModelCount,
        );
      },
    );
  }
}
