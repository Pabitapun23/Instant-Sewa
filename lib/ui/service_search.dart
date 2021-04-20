import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:instantsewa/application/InstantSewa_api.dart';
import 'package:instantsewa/ui/sub_category_search.dart';
import 'package:instantsewa/ui/sub_sub_categories_page.dart';
import 'package:instantsewa/util/hexcode.dart';

class ServiceSearch extends SearchDelegate<String> {
  //model
  final List<String> subCategory = [];
  String result;
  ServiceSearch() {
    getSearchData();
  }
  Future getSearchData() async {
    final response = await InstantSewaAPI.dio.get("/search");
    List _temp = response.data['subcategory'];

    for (int i = 0; i < _temp.length; i++) subCategory.add(_temp[i]['name']);
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
        close(context, result);
      },
    );
    //leading icon on the left of search bar
  }

  @override
  Widget buildResults(BuildContext context) {
    final suggestionList =
        subCategory.where((p) => p.toLowerCase().contains(query.toLowerCase()));
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
//        onTap: () => Navigator.push(
//            context,
//            // ignore: missing_return
//            MaterialPageRoute(builder: (context) => SubSubCategoriesPage())),
        leading: Icon(Icons.search),
        title: Text(
          suggestionList.elementAt(index),
        ),
        onTap: () {
          result = suggestionList.elementAt(index);
          Navigator.push(
            context,
            // ignore: missing_return
            MaterialPageRoute(
              builder: (context) => SubSearchPage(
                subCategoryName: result,
              ),
            ),
          );
        },
      ),
      itemCount: suggestionList.length,
    );

    // show some result based on the selection
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // show when someone searches for something
    final suggestionList =
        subCategory.where((p) => p.toLowerCase().contains(query.toLowerCase()));
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
//        onTap: () => Navigator.push(
//            context,
//            // ignore: missing_return
//            MaterialPageRoute(builder: (context) => SubSubCategoriesPage())),

        leading: Icon(Icons.search),
        title: Text(
          suggestionList.elementAt(index),
        ),
        onTap: () {
          query = suggestionList.elementAt(index);
        },
      ),
      itemCount: suggestionList.length,
    );
  }
}
