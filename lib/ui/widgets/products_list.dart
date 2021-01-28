import 'package:flutter/material.dart';
import 'package:shop/data_layer/product_provider.dart';
import 'package:shop/models/item.dart';
import 'package:shop/ui/screens/add_product.dart';
import 'package:provider/provider.dart';
import 'package:shop/ui/widgets/product_tile.dart';

class ProductsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productList = Provider.of<List<ItemModel>>(context);
    final productProvider = Provider.of<ProductProvider>(context);
    final orientation = MediaQuery.of(context).orientation;
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: (orientation == Orientation.portrait) ? 2 : 3),
        itemCount: (productList == null) ? 0 : productList.length,
        itemBuilder: (context, index) {
          final product = productList[index];
          return ProductTile(
            product: product,
            pressCallback: () {
              Navigator.pushNamed(
                context,
                AddProduct.id,
                arguments: {'product': product},
              );
            },
            longPressCallback: () {
              productList.remove(product);
              productProvider.loadValues(product);
              productProvider.removeData();
            },
          );
        });
  }
}
