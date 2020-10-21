import 'package:flutter/cupertino.dart';
import 'package:instantsewa/providers/cart.dart';
import 'package:instantsewa/state/service_state.dart';
import 'package:instantsewa/ui/cart_page.dart';
import 'package:instantsewa/util/hexcode.dart';
import 'package:instantsewa/widgets/badge.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
// ignore: must_be_immutable
class SubSubCategoriesDetailsPage extends StatefulWidget {
  final String serviceName;
  final String subCategoryName;
  final String id;
  SubSubCategoriesDetailsPage(
      {this.id, this.serviceName, this.subCategoryName});

  @override
  _SubSubCategoriesDetailsPageState createState() =>
      _SubSubCategoriesDetailsPageState(serviceName, subCategoryName);
}

class _SubSubCategoriesDetailsPageState
    extends State<SubSubCategoriesDetailsPage>
    with AutomaticKeepAliveClientMixin {
  final _serviceDetailsStateRM = RM.get<ServiceState>();

  _SubSubCategoriesDetailsPageState(this.serviceName, this.subCategoryName);
  @override
  void initState() {
    _serviceDetailsStateRM.setState((serviceDetailsState) =>
        serviceDetailsState.getAllServiceDetails(widget.id));
    super.initState();
  }

  final String serviceName;
  final String subCategoryName;

  @override
  Widget build(BuildContext context) {
    super.build(context);
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
        title: Text(serviceName),
        backgroundColor: _purple,
      ),
      body: Container(
        child: StateBuilder<ServiceState>(
            observe: () => _serviceDetailsStateRM,
            builder: (context, model) {
              return ListView(
                children: [
                  ...model.state.serviceDetails.map(
                    (serviceDetails) => Column(children: [
                      Container(
                        height: 200,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          image:
                              ExactAssetImage('${serviceDetails.serviceImage}'),
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
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              serviceDetails.serviceQuantity,
                              style: TextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.w800),
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
                                serviceDetails.serviceId,
                                subCategoryName,
                                serviceDetails.serviceName,
                                int.parse(serviceDetails.servicePrice));
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
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          serviceDetails.serviceDescription,
                          style: TextStyle(fontSize: 18.0),
                        ),
                      ),
                    ]),
                  ),
                ],
              );
            }),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
