import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop/constant.dart';
import 'package:shop/models/item.dart';
import 'package:sweetsheet/sweetsheet.dart';

class ProductTile extends StatefulWidget {
  final ItemModel product;
  final Function pressCallback;
  final Function longPressCallback;
  ProductTile(
      {@required this.product,
      @required this.pressCallback,
      @required this.longPressCallback});

  @override
  _ProductTileState createState() => _ProductTileState();
}

class _ProductTileState extends State<ProductTile> {
  final SweetSheet _sweetSheet = SweetSheet();

  @override
  Widget build(BuildContext context) {
    print('${widget.product.title}');
    return GestureDetector(
      onTap: widget.pressCallback,
      onLongPress: () {
        _sweetSheet.show(
          context: context,
          title: Text("Delete this product?"),
          description: Text(''),
          color: SweetSheetColor.NICE,
          // color: CustomSheetColor(
          //   main: Colors.white,
          //   accent: Color(0xff5A67D8),
          //   icon: Color(0xff5A67D8),
          // ),
          icon: Icons.delete,
          positive: SweetSheetAction(
            onPressed: () {
              widget.longPressCallback();
              Navigator.of(context).pop();
            },
            title: 'DELETE',
          ),
          negative: SweetSheetAction(
            onPressed: () {
              Navigator.of(context).pop();
            },
            title: 'CANCEL',
          ),
        );
      },
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Container(
          alignment: Alignment.bottomCenter,
          decoration: BoxDecoration(
            image: DecorationImage(
              //image: NetworkImage(product.thumbnailUrl),
              image: AssetImage(widget.product.thumbnailUrl),
              fit: BoxFit.cover,
              alignment: Alignment.center,
            ),
          ),
          child: Container(
            alignment: Alignment.bottomLeft,
            margin: EdgeInsets.only(left: 20),
            padding: EdgeInsets.all(10),
            child: Text(
              '${widget.product.title}',
              style: TextStyle(
                  backgroundColor: Colors.black54.withOpacity(0.2),
                  color: Colors.white,
                  fontSize: 19,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 8,
        shadowColor: Colors.grey,
        margin: EdgeInsets.all(10),
      ),
    );
  }
}
