import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shop/models/item.dart';

class FireStoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  String path = "Products";
  CollectionReference ref;

  FireStoreService() {
    ref = _db.collection(path);
  }
  Future<void> saveProduct(ItemModel product) {
    print(product.title);
    return ref.doc(product.id).set(product.toJson());
  }

  Stream<List<ItemModel>> getProducts() {
    var s = ref.snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => ItemModel.fromFirestore(doc)).toList());
    return s;
  }

  // Future<ItemModel> getDocumentById(String id) async {
  //   var snap = await ref.doc(id).get();
  //   return ItemModel.fromMap(snap.data());
  // }

  Future<void> removeProduct(String id) {
    return ref.doc(id).delete();
  }
}
