import 'package:flutter/cupertino.dart';
import 'package:instantsewa/providers/cart.dart';
import 'package:instantsewa/ui/cart_page.dart';
import 'package:instantsewa/util/hexcode.dart';
import 'package:instantsewa/providers/categories.dart';
import 'package:instantsewa/widgets/badge.dart';
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
    final serviceData = Provider.of<Categories>(context);
    final subCategory = serviceData.services[subCategoryIndex].subCategories;
    final subSubCategoryId =
        serviceData.services[subCategoryIndex].subSubCategoriesId;
    final subSubCategory =
        serviceData.services[subCategoryIndex].subSubCategories;
    final image = serviceData.services[subCategoryIndex].subSubCategoriesImage;
    final qty = serviceData.services[subCategoryIndex].qty;
    final desc = serviceData.services[subCategoryIndex].desc;
    final price = serviceData.services[subCategoryIndex].price;
    final cart = Provider.of<Cart>(context, listen: false);
    Color _purple = HexColor('#603f8b');
    return Scaffold(
      appBar: AppBar(
        actions: [
          Consumer<Cart>(
            builder: (_, cart, ch) => Badge(
              child: ch,
              value: cart.serviceCount.toString(),
            ),
            child: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => CartPage()));
              },
            ),
          )
        ],
        title: Text(subSubCategory[subSubCategoryIndex]),
        backgroundColor: _purple,
      ),
      body: Container(
        child: ListView(
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: ExactAssetImage(image[subSubCategoryIndex]),
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
                    onPressed: () {},
                    child: Icon(
                      Icons.remove,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    qty[subSubCategoryIndex].toString(),
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
                    onPressed: () {},
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
                    borderRadius: BorderRadius.circular(25.0)),
                onPressed: () {
                  cart.addServices(
                      subSubCategoryId[subSubCategoryIndex],
                      subCategory,
                      subSubCategory[subSubCategoryIndex],
                      price[subSubCategoryIndex]);
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
                desc[subSubCategoryIndex],
                style: TextStyle(fontSize: 18.0),
              ),
            )
          ],
        ),
      ),
    );
  }
}
