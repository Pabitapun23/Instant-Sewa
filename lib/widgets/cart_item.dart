import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart';

class CartItem extends StatelessWidget {
  final String id;
  final String serviceId;
  final double price;
  final int qty;
  final String subCategory;
  final String subSubCategory;

  const CartItem(
      {this.id,
      this.price,
      this.qty,
      this.subCategory,
      this.subSubCategory,
      this.serviceId});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      background: Container(
        color: Colors.red[700],
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        Provider.of<Cart>(context, listen: false).removeItem(serviceId);
      },
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListTile(
            title: Text(
              subSubCategory,
              style: TextStyle(fontSize: 18),
            ),
            subtitle: Text(
              'Total: \$${(price * qty)}',
              style: TextStyle(fontSize: 15),
            ),
            trailing: Text(
              '$qty x',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ),
    );
  }
}
