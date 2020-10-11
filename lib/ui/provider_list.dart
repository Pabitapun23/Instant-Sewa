import 'package:flutter/material.dart';
import 'package:instantsewa/model/provider_model.dart';
import 'package:instantsewa/ui/service_provider_details_page.dart';

// ignore: must_be_immutable
class ProviderList extends StatelessWidget {
  List<Provider> items;
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
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          ServiceProviderDetailsPage(
                            index: index,
                          )));
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  width: 130,
                  height: 100,
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(3.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    image: DecorationImage(
                      image: ExactAssetImage('images/photos/provider.png'),
                      fit: BoxFit.contain,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0, 5),
                        blurRadius: 10,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  width: 130,
                  alignment: Alignment.center,
                  child: Text(
                    data.name,
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  ),
                ),
                Container(
                  width: 130,
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(left: 4.0, top: 4.0),
                  child: Text(
                    data.job,
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
