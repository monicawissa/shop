import 'dart:collection';

import 'package:card_settings/card_settings.dart';
import 'package:card_settings/widgets/card_settings_panel.dart';
import 'package:card_settings/widgets/card_settings_widget.dart';
import 'package:card_settings/widgets/information_fields/card_settings_header.dart';
import 'package:card_settings/widgets/text_fields/card_settings_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/data_layer/product_provider.dart';
import 'package:shop/models/item.dart';

class AddProduct extends StatefulWidget {
  static String id = '/addProduct';
  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  static String id = '/addProduct';
  final _formKey = GlobalKey<FormState>();
  String productType = 'Bag';
  var routeData;

  @override
  void initState() {
    super.initState();
    final productProvider =
        Provider.of<ProductProvider>(context, listen: false);
    new Future.delayed(Duration(microseconds: 10), () {
      routeData =
          ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
    }).then((_) => routeData == null
        ? new Future.delayed(Duration.zero, () {
            productProvider.loadValues(ItemModel(
                title: '',
                longDescription: '',
                thumbnailUrl: 'assets/shoes.jpg',
                price: 0.0,
                rate: 0.0));
          })
        : Future.delayed(Duration.zero, () {
            print(routeData);
            final ItemModel product = routeData['product'];
            ItemModel p = ItemModel(
                id: product.id,
                title: product.title,
                price: product.price,
                longDescription: product.longDescription,
                thumbnailUrl: product.thumbnailUrl,
                rate: product.rate);
            productProvider.loadValues(p);
          }));
  }

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    ItemModel prod = ItemModel(
        id: productProvider.id,
        title: productProvider.title,
        longDescription: productProvider.longDescription,
        price: productProvider.price,
        rate: productProvider.rate,
        thumbnailUrl: productProvider.thumbnailUrl);
    print((prod.id == null) ? 'null' : prod.id);
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Detail'),
      ),
      body: card_form(productProvider, prod, context),
    );
  }

  Center card_form(
      ProductProvider productProvider, ItemModel prod, BuildContext context) {
    return Center(
      child: Form(
          key: _formKey,
          child: CardSettings(children: <CardSettingsSection>[
            CardSettingsSection(
              header: CardSettingsHeader(
                label: 'Product Details',
              ),
              children: <CardSettingsWidget>[
                CardSettingsListPicker(
                  label: 'Type',
                  initialValue: 'shoes',
                  hintText: 'Select One',
                  options: [
                    'bag',
                    'shoes',
                    'dress',
                    'computer',
                    'eyewear',
                    'watch',
                    'phone'
                  ],
                  onChanged: (value) {
                    //productProvider.thumbnailUrl = value;
                    setState(() {
                      productProvider.loadValues(prod);
                      prod = _itemsModel[value];
                    });
                  },
                  onSaved: (value) {
                    //productProvider.thumbnailUrl = value;
                    prod = _itemsModel[value];
                    prod.id = productProvider.id;
                  },
                ),
                CardSettingsText(
                  label: 'Title',
                  initialValue: prod.title,
                  validator: (value) {
                    if (value == null || value.isEmpty)
                      return 'Title is required.';
                    return null;
                  },
                  onSaved: (value) => prod.title = value,
                ),
                CardSettingsNumberPicker(
                  label: 'Rate',
                  min: 0,
                  max: 5,
                  initialValue: prod.rate.toInt(),
                  onSaved: (value) => prod.rate = value.toDouble(),
                ),
                CardSettingsDouble(
                  label: 'Price:',
                  initialValue: prod.price,
                  onSaved: (value) => prod.price = value,
                ),
                CardSettingsParagraph(
                  label: 'Description:',
                  initialValue: prod.longDescription,
                  onSaved: (value) => prod.longDescription = value,
                ),
                CardSettingsButton(
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();
                      productProvider.loadValues(prod);
                      productProvider.saveData();
                      Navigator.of(context).pop();
                    }
                  },
                  label: 'Save',
                  backgroundColor: Colors.blue,
                  textColor: Colors.black,
                )
              ],
            ),
          ])),
    );
  }
}

Map<String, ItemModel> _itemsModel = {
  'bag': ItemModel(
      title: 'Back Pack',
      longDescription:
          "Silver backpack from Kendall + Kylie, featuring a camo print, front exterior pocket, laptop pocket, and nylon and faux leather material. You can grab this backpack on your way to class or when you're traveling. Or pair with jeans and a T-shirt for a casual look." +
              "\n• Kendall + Kylie Hannah backpack '" +
              "\n• Camo silver print" +
              "\n• Laptop pocket" +
              "\n• Nylon and Faux Leather pocket",
      price: 52.14,
      rate: 3.0,
      thumbnailUrl: 'assets/bag.jpg'),
  'shoes': ItemModel(
      title: 'Fila shoes',
      longDescription: 'Fila Ray Repeat Women Sneakers',
      price: 250,
      rate: 4.0,
      thumbnailUrl: 'assets/shoes.jpg'),
  'eyewear': ItemModel(
      title: 'Eyewear',
      longDescription: "Sunglasses by ASOS" +
          "\n For your eyes only" +
          "\n Lightweight frames" +
          "\n Adjustable silicone nose pads for added comfort",
      price: 50,
      rate: 2.0,
      thumbnailUrl: 'assets/eyewear.jpg'),
  'phone': ItemModel(
      title: 'Infinix phone',
      longDescription: "details :Brand: Infinix" +
          "\n Color: Purple" +
          "\n Platform" +
          "\n Network: 4G/3G/2G" +
          "\n CPU Frequency: 2.0 GHz",
      price: 250,
      rate: 3.0,
      thumbnailUrl: 'assets/phone.jpg'),
  'dress': ItemModel(
      title: 'dress',
      longDescription: "REALLY BEAUTIFUL AND ELEGANT DRESS. GOOD QUALITY.& " +
          "\n Item : Evening Gown / Dress " +
          "\n  Size : Medium " +
          "\n  Color : Black" +
          "\n Fabric: 60%Cotton, 40%Polyacrylic Fiber",
      price: 1250,
      rate: 2.0,
      thumbnailUrl: 'assets/dress.jpg'),
  'computer': ItemModel(
      title: 'computer',
      longDescription: "REALLY BEAUTIFUL AND ELEGANT DRESS. GOOD QUALITY.& " +
          "\n Item : Evening Gown / Dress " +
          "\n  Size : Medium " +
          "\n  Color : Black" +
          "\n Fabric: 60%Cotton, 40%Polyacrylic Fiber",
      price: 250,
      rate: 4.0,
      thumbnailUrl: 'assets/computer.jpg'),
  'watch': ItemModel(
      title: 'watch',
      longDescription: "REALLY BEAUTIFUL AND ELEGANT DRESS. GOOD QUALITY.& " +
          "\n Item : Evening Gown / Dress " +
          "\n  Size : Medium " +
          "\n  Color : Black" +
          "\n Fabric: 60%Cotton, 40%Polyacrylic Fiber",
      price: 250,
      rate: 4.0,
      thumbnailUrl: 'assets/watch.jpg')
};
