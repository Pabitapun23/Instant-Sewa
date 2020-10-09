import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instantsewa/Store/MyStore.dart';
import 'package:instantsewa/ui/service_provider_selection.dart';
import 'package:instantsewa/util/hexcode.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  final int cartIndex;
  const CartPage({Key key, this.cartIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var service = Provider.of<MyStore>(context);

    Color _purple = HexColor('#603f8b');
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        backgroundColor: _purple,
      ),
      body: Material(
        child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Text(
                          'DESCRIPTION',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 17.0),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          'RATE',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 17.0),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          'QTY',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 17.0),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          'AMOUNT',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 17.0),
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    thickness: 1.0,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
            Positioned(
              top: 40.0,
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return Container(
                      alignment: AlignmentDirectional.topStart,
                      height: (MediaQuery.of(context).size.height) * 0.3,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              service.services[index].categories,
                              style: TextStyle(
                                  fontSize: 17.0, fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    service.services[index]
                                        .subSubCategories[index],
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    service.services[index].price[index]
                                        .toString(),
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    service.services[index].qty[index]
                                        .toString(),
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    service.services[index].price[index]
                                        .toString(),
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider(
                      thickness: 1.0,
                      color: Colors.black,
                    );
                  },
                  itemCount: service.carts.length),
            )
          ],
        ),
      ),
    );
  }
}
