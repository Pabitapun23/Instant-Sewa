import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:instantsewa/application/InstantSewa_api.dart';
import 'package:instantsewa/providers/cart.dart';
import 'package:instantsewa/ui/cart_page.dart';
import 'package:instantsewa/ui/favorites_page.dart';
import 'package:instantsewa/ui/home_list.dart';
import 'package:instantsewa/ui/profile_page.dart';
import 'package:instantsewa/util/hexcode.dart';
import 'package:instantsewa/widgets/badge.dart';
import 'package:provider/provider.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import 'home_list.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> _widgetList = [
    HomeList(),
    Favourites(),
    CartPage(),
    ProfilePage(),
  ];

  int _index = 0;
  Color _purple = HexColor('#603f8b');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 54.0,
        child: BottomNavigationBar(
          selectedItemColor: _purple,
          unselectedItemColor: Colors.black,
          type: BottomNavigationBarType.shifting,
          currentIndex: _index,
          onTap: (index) {
            setState(() {
              _index = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              title: Text('Favourites'),
            ),
            BottomNavigationBarItem(
              icon: Consumer<Cart>(
                builder: (_, cart, ch) => Badge(
                  child: ch,
                  value: cart.serviceCount.toString(),
                ),
                child: Icon(Icons.shopping_cart),
              ),
              title: Text('Cart'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text('Profile'),
            ),
          ],
        ),
      ),
      body: _widgetList[_index],
    );
  }
}
