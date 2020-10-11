import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instantsewa/model/service_model.dart';

// ignore: must_be_immutable
class CategoryList extends StatelessWidget {
  List<Service> category;
  CategoryList({this.category});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      alignment: Alignment.center,
      child: ListView.builder(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        itemCount: category.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          var data = category[index];
          return Container(
            width: 160,
            child: Card(
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              elevation: 5.0,
              shadowColor: Colors.black38,
              margin: EdgeInsets.all(10),
              child: Column(
                children: [
                  Image.asset(
                    data.img,
                    width: 70,
                    fit: BoxFit.fill,
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Divider(
                    color: Colors.black38,
                  ),
                  Text(
                    data.name,
                    style: TextStyle(fontSize: 16.0),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
