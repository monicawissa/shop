import 'package:flutter/foundation.dart';
import 'package:shop/models/item.dart';
import 'package:uuid/uuid.dart';
import 'dart:collection';

import 'firestore_service.dart';

class ProductProvider extends ChangeNotifier {
  final service = FireStoreService();
  String _id;
  String _title;
  String _thumbnailUrl;
  String _longDescription;
  double _rate;
  double _price;

  String get id => _id;
  var uuid = Uuid();
//Getter
  String get title => _title;

  String get thumbnailUrl => _thumbnailUrl;

  String get longDescription => _longDescription;

  double get rate => _rate;

  double get price => _price;

  //setter
  loadValues(ItemModel product) {
    _id = product.id;
    _title = product.title;
    _thumbnailUrl = product.thumbnailUrl;
    _longDescription = product.longDescription;
    _rate = product.rate;
    _price = product.price;
    notifyListeners();
  }

  void saveData() {
    var newProduct = ItemModel(
        title: title,
        thumbnailUrl: thumbnailUrl,
        longDescription: longDescription,
        rate: rate,
        id: (_id == null) ? uuid.v4() : id,
        price: price);
    print(id);
    service.saveProduct(newProduct);
    notifyListeners();
  }

  void removeData() {
    service.removeProduct(id);
    notifyListeners();
  }

  set title(String value) {
    _title = value;
    notifyListeners();
  }

  set thumbnailUrl(String value) {
    _thumbnailUrl = value;
    notifyListeners();
  }

  set longDescription(String value) {
    _longDescription = value;
    notifyListeners();
  }

  set rate(double value) {
    _rate = value;
    notifyListeners();
  }

  set price(double value) {
    _price = value;
    notifyListeners();
  }
}
