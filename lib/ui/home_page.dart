import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:instantsewa/Store/MyStore.dart';
import 'package:instantsewa/ui/favorites_page.dart';
import 'package:instantsewa/ui/home_list.dart';
import 'package:instantsewa/ui/login_page.dart';
import 'package:instantsewa/ui/profile_page.dart';
import 'package:instantsewa/ui/signup_page.dart';
import 'package:instantsewa/util/hexcode.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'cart_page.dart';
import 'home_list.dart';
import 'main_drawer.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> _widgetList = [
    HomeList(),
    Favourites(),
    CartPage(),
    LoginPage(),
  ];

  int _index = 0;
  Color _purple = HexColor('#603f8b');
  @override
  Widget build(BuildContext context) {
    var service = Provider.of<MyStore>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        brightness: Brightness.dark,
        elevation: 0,
        backgroundColor: _purple,
        title: Text(
          'Instant Sewa',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: ServiceSearch());
            },
          ),
          Icon(
            Icons.notifications,
            color: Colors.white,
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      drawer: MainDrawer(),
      bottomNavigationBar: SizedBox(
        height: 58.0,
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
              icon: Stack(
                children: [
                  Icon(
                    Icons.shopping_cart,
                  ),
                  Positioned(
                    top: 0,
                    bottom: 0,
                    child: Stack(
                      children: [
                        Icon(
                          Icons.brightness_1,
                          size: 15.0,
                          color: Colors.red[700],
                        ),
                        Positioned(
                            top: 3.0,
                            right: 7.0,
                            child: Center(
                              child: Text(
                                '',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w500),
                              ),
                            )),
                      ],
                    ),
                  ),
                ],
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
class ServiceSearch extends SearchDelegate<String> {
  //model
  final services = [
    "electrical",
    "plumbing",
    "cleaning",
    "painting",
    "beauty services"
  ];
  final recentServices = ["electrical", "plumbing"];

  @override
  List<Widget> buildActions(BuildContext context) {
    //actions in app bar
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () => query = "",
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
    //leading icon on the left of search bar
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text(query);

    // show some result based on the selection
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // show when someone searches for something
    final suggestionList = query.isEmpty
        ? recentServices
        : services.where((p) => p.startsWith(query)).toList();
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => ServiceProviders())),
        leading: Icon(Icons.search),
        title: RichText(
          text: TextSpan(
              text: suggestionList[index].substring(0, query.length),
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              children: [
                TextSpan(
                  text: suggestionList[index].substring(query.length),
                  style: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.bold),
                )
              ]),
        ),
      ),
      itemCount: suggestionList.length,
    );
  }
}

class ServiceProviders extends StatelessWidget {
  final serviceProviders = ["Ram", "Laxman", "Hari", "Shyam", "Gita"];

  @override
  Widget build(BuildContext context) {
    Color _purple = HexColor('#603f8b');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _purple,
        title: Text("Service Providers"),
        centerTitle: true,
        // backgroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: serviceProviders.length,
        itemBuilder: (context, index) => Card(
          elevation: 4,
          color: Colors.white,
          child: ListTile(
            title: Text(serviceProviders[index]),
            subtitle: Text("good"),
          ),
        ),
      ),
    );
  }
}
