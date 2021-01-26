import 'package:cloud_firestore/cloud_firestore.dart';

class ItemModel {
  String title;
  String thumbnailUrl;
  String longDescription;
  double rate;
  double price;

  ItemModel({
    this.title,
    this.thumbnailUrl,
    this.longDescription,
    this.price = 0,
    this.rate = 0.0,
  });
  ItemModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    thumbnailUrl = json['thumbnailUrl'];
    longDescription = json['longDescription'];
    rate = json['rate'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['price'] = this.price;
    data['thumbnailUrl'] = this.thumbnailUrl;
    data['longDescription'] = this.longDescription;
    data['rate'] = this.rate;
    return data;
  }
}
