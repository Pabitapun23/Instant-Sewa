import 'package:flutter/material.dart';
import 'package:instantsewa/model/service_model.dart';
// ignore: must_be_immutable
class CategoryList  extends StatelessWidget {
  List<Service>category;
  CategoryList(this.category);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      alignment: Alignment.centerLeft,
      child: ListView.builder(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        itemCount: category.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          var data = category[index];
          return Column(
            children: <Widget>[
              Container(
                width: 95,
                height: 95,
                alignment: Alignment.center,
                margin: EdgeInsets.all(10.0),
                child: Image.asset(
                  data.img,
                  width:50,
                ),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12.withOpacity(0.5),
                        offset: Offset(0, 5),
                        blurRadius: 15,
                      )
                    ]),
              ),
              Row(
                children: <Widget>[
                  Text(data.name),
                  Icon(
                    Icons.keyboard_arrow_right,
                    size: 14,
                  ),
                ],
              )
            ],
          );
        },
      ),
    );
  }
}