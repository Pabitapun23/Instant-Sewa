import 'package:flutter/cupertino.dart';
import 'package:instantsewa/ui/cart_page.dart';
import 'package:instantsewa/ui/service_provider_selection.dart';
import 'package:instantsewa/util/hexcode.dart';
import 'package:instantsewa/Store/MyStore.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class SubSubCategoriesDetailsPage extends StatelessWidget {
  final int subSubCategoryIndex;
  final int subCategoryIndex;

  const SubSubCategoriesDetailsPage(
      {Key key, this.subSubCategoryIndex, this.subCategoryIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var service = Provider.of<MyStore>(context);
    Color _purple = HexColor('#603f8b');
    return Scaffold(
      appBar: AppBar(
        actions: [
          Stack(
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.shopping_cart,
                ),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => CartPage(),
                  ),
                ),
              ),
              Stack(
                children: <Widget>[
                  Icon(Icons.brightness_1, size: 20.0, color: Colors.red[700]),
                  Positioned(
                      top: 3.0,
                      right: 7,
                      child: Center(
                        child: Text(
                          service.getCartNumber(subSubCategoryIndex).toString(),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.0,
                              fontWeight: FontWeight.w500),
                        ),
                      )),
                ],
              ),
            ],
          ),
        ],
        title:
            Text(service.activeService.subSubCategories[subSubCategoryIndex]),
        backgroundColor: _purple,
      ),
      body: Container(
        child: ListView(
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: ExactAssetImage(service.services[subCategoryIndex].img),
              )),
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 40,
                  height: 30,
                  child: OutlineButton(
                    padding: EdgeInsets.zero,
                    borderSide: BorderSide(color: _purple, width: 3),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13),
                    ),
                    onPressed: () {
                      //add the value in qty
                      service.decreaseQty(
                          service.activeService, subSubCategoryIndex);
                    },
                    child: Icon(
                      Icons.remove,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    service.services[subCategoryIndex].qty[subSubCategoryIndex]
                        .toString(),
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.w800),
                  ),
                ),
                SizedBox(
                  width: 40,
                  height: 30,
                  child: OutlineButton(
                    borderSide: BorderSide(color: _purple, width: 3),
                    focusColor: _purple,
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13),
                    ),
                    onPressed: () {
                      //remove the value from qty
                      service.increaseQty(
                          service.activeService, subSubCategoryIndex);
                    },
                    child: Icon(
                      Icons.add,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                color: _purple,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0)),
                onPressed: () {
//                  service.addOneItemToCart(
//                      service.activeService, subSubCategoryIndex);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              ServiceProviderSelection()));
                },
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Text(
                    'Add to Cart',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0),
                  ),
                ),
              ),
            ),
            Center(
              child: Text(
                'This service includes:',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                service.services[subCategoryIndex].desc[subSubCategoryIndex],
                style: TextStyle(fontSize: 18.0),
              ),
            )
          ],
        ),
      ),
    );
  }
}
