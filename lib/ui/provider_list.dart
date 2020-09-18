import 'package:flutter/material.dart';
import 'package:instantsewa/model/provider_model.dart';

// ignore: must_be_immutable
class ProviderList   extends StatelessWidget {
  List<Provider>items;
  ProviderList(this.items);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      alignment: Alignment.centerLeft,
      child: ListView.builder(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        itemCount: items.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          var data = items[index];
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                width: 130,
                height: 100,
                alignment: Alignment.center,
                margin: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.white,
                    image: DecorationImage(
                      image: ExactAssetImage('images/flag.png'),
                      fit: BoxFit.cover,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0, 5),
                        blurRadius: 10,
                      )
                    ]),
              ),
              Container(
                width: 130,
                alignment: Alignment.centerLeft,
                child: Text(
                  data.name,
                  style: TextStyle(fontSize: 14, color: Colors.black),
                ),
              ),
              Container(
                width: 130,
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: 4.0, top: 4.0),
                child: Text(
                  'Pricing',
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          );
        },
      ),
    );
  }


}