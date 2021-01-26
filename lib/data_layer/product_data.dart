import 'package:flutter/foundation.dart';
import 'package:shop/models/item.dart';
import 'dart:collection';

class ProductData extends ChangeNotifier {
  List<ItemModel> _itemsModel = [
    ItemModel(
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
    ItemModel(
        title: 'Fila shoes',
        longDescription: 'Fila Ray Repeat Women Sneakers',
        price: 250,
        rate: 4.0,
        thumbnailUrl: 'assets/shoes.jpg'),
    ItemModel(
        title: 'Eyewear',
        longDescription: "Sunglasses by ASOS" +
            "\n For your eyes only" +
            "\n Lightweight frames" +
            "\n Adjustable silicone nose pads for added comfort",
        price: 50,
        rate: 2.0,
        thumbnailUrl: 'assets/eyewear.jpg'),
    ItemModel(
        title: 'bag',
        longDescription: 'big bag for school',
        price: 250,
        rate: 3.0,
        thumbnailUrl: 'assets/bag.jpg'),
    ItemModel(
        title: 'Infinix phone',
        longDescription: "details :Brand: Infinix" +
            "\n Color: Purple" +
            "\n Platform" +
            "\n Network: 4G/3G/2G" +
            "\n CPU Frequency: 2.0 GHz",
        price: 250,
        rate: 3.0,
        thumbnailUrl: 'assets/phone.jpg'),
    ItemModel(
        title: 'dress',
        longDescription: "REALLY BEAUTIFUL AND ELEGANT DRESS. GOOD QUALITY.& " +
            "\n Item : Evening Gown / Dress " +
            "\n  Size : Medium " +
            "\n  Color : Black" +
            "\n Fabric: 60%Cotton, 40%Polyacrylic Fiber",
        price: 1250,
        rate: 2.0,
        thumbnailUrl: 'assets/dress.jpg'),
    ItemModel(
        title: 'computer',
        longDescription: "REALLY BEAUTIFUL AND ELEGANT DRESS. GOOD QUALITY.& " +
            "\n Item : Evening Gown / Dress " +
            "\n  Size : Medium " +
            "\n  Color : Black" +
            "\n Fabric: 60%Cotton, 40%Polyacrylic Fiber",
        price: 250,
        rate: 4.0,
        thumbnailUrl: 'assets/computer.jpg'),
  ];

  UnmodifiableListView<ItemModel> get itemModel {
    return UnmodifiableListView(_itemsModel);
  }

  void addTask(String newTaskTitle) {
    final itemModel = ItemModel(
        title: 'bag',
        longDescription: 'big bag for school',
        price: 250,
        rate: 3.0,
        thumbnailUrl: 'assets/bag.jpg');
    _itemsModel.add(itemModel);
    notifyListeners();
  }

  void updateItemModel(ItemModel itemModel) {
    notifyListeners();
  }

  void deleteItemModel(ItemModel itemModel) {
    _itemsModel.remove(itemModel);
    notifyListeners();
  }

  int get itemsModelCount {
    return _itemsModel.length;
  }
}
