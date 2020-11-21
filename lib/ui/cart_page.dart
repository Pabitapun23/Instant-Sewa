import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instantsewa/providers/cart.dart' show Cart;
import 'package:instantsewa/router/route_constants.dart';
import 'package:instantsewa/ui/address_page.dart';
import 'package:instantsewa/ui/categories_list_page.dart';
import 'package:instantsewa/ui/schedule_page.dart';
import 'package:instantsewa/util/hexcode.dart';
import 'package:provider/provider.dart';
import '../application/storage/localstorage.dart';
import '../application/storage/storage_keys.dart';
import '../widgets/cart_item.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Color _purple = HexColor('#603f8b');
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
        backgroundColor: _purple,
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushNamed(context, homeRoute);
          },
        ),
      ),
      bottomSheet: Wrap(
        children: [
          Card(
            margin: EdgeInsets.all(15),
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text(
                        'Total',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Chip(
                        label: Text(
                          '\$${cart.totalAmount}',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        backgroundColor: _purple,
                      ),
                    ],
                  ),
                  Spacer(),
                  FlatButton(
                    child: Text(
                      'ADD MORE',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: _purple),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  AllCategoryList()));
                    },
                  ),
                  FlatButton(
                    child: Text(
                      'CONTINUE',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: _purple),
                    ),
                    onPressed: () {
                      if (cart.services.isEmpty) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text("Alert"),
                              content: const Text("Cart is empty!!"),
                              actions: <Widget>[
                                FlatButton(
                                  onPressed: () =>
                                      Navigator.of(context).pop(true),
                                  child: Text(
                                    "Ok",
                                    style:
                                        TextStyle(color: _purple, fontSize: 18),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      } else {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                                title: Text(
                                  'Confirm your Address',
                                  style: TextStyle(color: _purple),
                                ),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    FlatButton(
                                      onPressed: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              SchedulePage(
                                            cartList: cart.getId(cart
                                                .services.values
                                                .toList()[0]
                                                .subCategoryName),
                                            subCategoryName: cart
                                                .services.values
                                                .toList()[0]
                                                .subCategoryName,
                                            latitude: LocalStorage.getItem(
                                                ADDRESS_LATITUDE),
                                            longitude: LocalStorage.getItem(
                                                ADDRESS_LONGITUDE),
                                            address: LocalStorage.getItem(
                                                ADDRESS_ADDRESS),
                                          ),
                                        ),
                                      ),
                                      child: Text(
                                        "Home address",
                                        style: TextStyle(fontSize: 18),
                                      ),
                                    ),
                                    FlatButton(
                                      onPressed: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              AddressPage(),
                                        ),
                                      ),
                                      child: Text(
                                        "Others",
                                        style: TextStyle(fontSize: 18),
                                      ),
                                    ),
                                  ],
                                ));
                          },
                        );
                      }
                    },
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cart.services.length,
              itemBuilder: (ctx, i) => CartItem(
                id: cart.services.values.toList()[i].id,
                price: cart.services.values.toList()[i].price,
                qty: cart.services.values.toList()[i].quantity,
                subCategory: cart.services.values.toList()[i].subCategoryName,
                subSubCategory:
                    cart.services.values.toList()[i].subSubCategoryName,
                serviceId: cart.services.keys.toList()[i],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
