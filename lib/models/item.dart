import 'package:cloud_firestore/cloud_firestore.dart';

class ItemModel {
  String id;
  String title;
  String thumbnailUrl;
  String longDescription;
  double rate;
  double price;

  ItemModel({
    this.id,
    this.title,
    this.thumbnailUrl,
    this.longDescription,
    this.price,
    this.rate,
  });

  ItemModel.fromMap(Map snapshot)
      : id = snapshot['id'] ?? '',
        title = snapshot['title'] ?? '',
        thumbnailUrl = snapshot['thumbnailUrl'] ?? '',
        longDescription = snapshot['longDescription'] ?? '',
        rate = snapshot['rate'] ?? '',
        price = snapshot['price'] ?? '';

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['price'] = this.price;
    data['thumbnailUrl'] = this.thumbnailUrl;
    data['longDescription'] = this.longDescription;
    data['rate'] = this.rate;
    return data;
  }

  factory ItemModel.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data();
    return ItemModel(
        id: doc.id,
        title: data['title'] ?? '',
        price: data['price'] ?? 0,
        rate: data['rate'] ?? 0,
        thumbnailUrl: data['thumbnailUrl'] ?? '',
        longDescription: data['longDescription'] ?? '');
  }
}
