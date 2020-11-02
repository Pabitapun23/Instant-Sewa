import 'package:flutter/material.dart';
import 'package:instantsewa/util/hexcode.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart';

class CartItem extends StatelessWidget {
  final String id;
  final String serviceId;
  final int price;
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
    final cart = Provider.of<Cart>(context, listen: true);
    Color _purple = HexColor('#603f8b');
    return Dismissible(
      confirmDismiss: (DismissDirection direction) async {
        return await showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Delete Confirmation"),
              content:
                  const Text("Are you sure you want to delete this service?"),
              actions: <Widget>[
                FlatButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: Text(
                    "Delete",
                    style: TextStyle(color: _purple),
                  ),
                ),
                FlatButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: Text(
                    "Cancel",
                    style: TextStyle(color: _purple),
                  ),
                ),
              ],
            );
          },
        );
      },
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
        cart.removeItem(serviceId);
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
            trailing: Container(
              width: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 30,
                    height: 20,
                    child: OutlineButton(
                      padding: EdgeInsets.zero,
                      borderSide: BorderSide(color: _purple, width: 2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      onPressed: () {
                        if (cart.quantityCount(subSubCategory) == '1') {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text("Delete Confirmation"),
                                content: const Text(
                                    "Are you sure you want to delete this service?"),
                                actions: <Widget>[
                                  FlatButton(
                                    onPressed: () {
                                      cart.deleteService(
                                        serviceId,
                                        subCategory,
                                        subSubCategory,
                                        price,
                                      );
                                      Navigator.of(context).pop(true);
                                    },
                                    child: Text(
                                      "Delete",
                                      style: TextStyle(color: _purple),
                                    ),
                                  ),
                                  FlatButton(
                                    onPressed: () =>
                                        Navigator.of(context).pop(false),
                                    child: Text(
                                      "Cancel",
                                      style: TextStyle(color: _purple),
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        } else {
                          cart.deleteService(
                            serviceId,
                            subCategory,
                            subSubCategory,
                            price,
                          );
                        }
                      },
                      child: Icon(
                        Icons.remove,
                        size: 20,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      cart.quantityCount(subSubCategory),
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(
                    width: 30,
                    height: 20,
                    child: OutlineButton(
                      borderSide: BorderSide(color: _purple, width: 2),
                      focusColor: _purple,
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      onPressed: () {
                        cart.addServices(
                          serviceId,
                          subCategory,
                          subSubCategory,
                          price,
                        );
                      },
                      child: Icon(
                        Icons.add,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
