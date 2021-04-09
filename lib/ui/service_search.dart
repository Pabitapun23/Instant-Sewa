import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:instantsewa/application/InstantSewa_api.dart';
import 'package:instantsewa/util/hexcode.dart';

class ServiceSearch extends SearchDelegate<String> {
  //model
  List<dynamic> services = [];
  final recentServices = ["electrical", "plumbing"];
  ServiceSearch(){
    getServicesData();
  }
  Future getServicesData() async{
    final response = await InstantSewaAPI.dio.get("/search");
    List _temp = response.data['category'];

    for (int i = 0; i < _temp.length; i++) services.add(_temp[i]['name']);
  }
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
    List<dynamic> suggestionList = query.isEmpty
        ? recentServices
        : services.where((p) => p.toLowerCase().contains(query)).toList();
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