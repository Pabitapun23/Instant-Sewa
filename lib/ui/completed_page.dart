import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instantsewa/application/classes/tracker/cart.dart';
import 'package:instantsewa/state/tracking_state.dart';
import 'package:instantsewa/ui/payment_page.dart';
import 'package:instantsewa/ui/tracking_provider_details.dart';
import 'package:instantsewa/util/hexcode.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class CompletedPage extends StatefulWidget {
  final String orderId,cartName;


  const CompletedPage({Key key, this.orderId, this.cartName}) : super(key: key);
  @override
  _CompletedPageState createState() => _CompletedPageState();
}

class _CompletedPageState extends State<CompletedPage> {
  Color _purple = HexColor('#603f8b');
  final _trackingState = RM.get<TrackingState>();
  bool _isLoading = false;
  @override
  void initState() {
    _trackingState.setState((orderState) => orderState.getOperation(operationId: widget.orderId));
    _isLoading = false;
    super.initState();
  }
  double totalAmount(List<Cart>cart){
    var total=0.0;
    cart.forEach((carts) {
      total+=double.parse(carts.totalAmount);
    });
    return total;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.cartName),
        centerTitle: true,
        backgroundColor: _purple,
      ),
      body: StateBuilder<TrackingState>(
        observe: ()=>_trackingState,
        builder:(context,model){
          return ListView(
            children: [
              ...model.state.operation.map((operation) => Column(
                children: [
                 ...operation.cart.map((carts)
                => Column(
                     children: [
                       ListView(
                         shrinkWrap: true,
                         children: [
                           Padding(
                             padding: const EdgeInsets.all(4.0),
                             child: Container(
                               height: (MediaQuery.of(context).size.height) * 0.20,
                               decoration: BoxDecoration(
                                 color: Colors.white10,
                                 borderRadius: BorderRadius.circular(10),
                               ),
                               child: Card(
                                 elevation: 0.0,
                                 child: Padding(
                                   padding: const EdgeInsets.all(8.0),
                                   child: Column(
                                     mainAxisAlignment: MainAxisAlignment.center,
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                       Row(
                                         children: [
                                           CircleAvatar(
                                             radius: 25.0,
                                             child: ClipRRect(
                                               child: SizedBox(
                                                 width: 50.0,
                                                 height: 50.0,
                                                 child: Image.asset(
                                                   carts.image,
                                                   fit: BoxFit.fill,
                                                 ),
                                               ),
                                             ),
                                           ),
                                           SizedBox(
                                             width: 20,
                                           ),
                                           Text(
                                             carts.serviceName,
                                             style: GoogleFonts.openSans(
                                               textStyle: TextStyle(
                                                 color: Colors.black87,
                                                 fontSize: 16,
                                                 fontWeight: FontWeight.w600,
                                               ),
                                             ),
                                           ),
                                         ],
                                       ),
                                       Text(
                                         'Price: ${carts.price}',
                                         style: GoogleFonts.openSans(
                                           textStyle: TextStyle(
                                             color: Colors.black54,
                                             fontSize: 16,
                                             fontWeight: FontWeight.w600,
                                           ),
                                         ),
                                       ),
                                       Row(
                                         children: [
                                           Text(
                                             'Quantity: ${carts.quantity}',
                                             style: GoogleFonts.openSans(
                                               textStyle: TextStyle(
                                                 color: Colors.black54,
                                                 fontSize: 16,
                                                 fontWeight: FontWeight.w600,
                                               ),
                                             ),
                                           ),
                                           Spacer(),
                                           Text(
                                             'Total: ${carts.totalAmount}',
                                             style: GoogleFonts.openSans(
                                               textStyle: TextStyle(
                                                 color: Colors.black54,
                                                 fontSize: 16,
                                                 fontWeight: FontWeight.w600,
                                               ),
                                             ),
                                           ),
                                         ],
                                       ),
                                     ],
                                   ),
                                 ),
                               ),
                             ),
                           ),
                         ],
                       ),
                     ],
                   ),),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => ProviderDetailsPage(
                                  index: operation.serviceProviderId,
                                  status: operation.status,
                                )));
                      },
                      child: Container(
                        height: (MediaQuery.of(context).size.height) * 0.1,
                        decoration: BoxDecoration(
                          color: Colors.white10,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Card(
                          elevation: 0.0,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 20.0,
                                      backgroundColor: Colors.white,
                                      child: ClipRRect(
                                        child: SizedBox(
                                          width: 50.0,
                                          height: 50.0,
                                          child: Image.asset(
                                            "images/photos/provider.png",
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Assigned to:',
                                          style: GoogleFonts.openSans(
                                            textStyle: TextStyle(
                                              color: Colors.black87,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          operation.serviceProviderName,
                                          style: GoogleFonts.openSans(
                                            textStyle: TextStyle(
                                              color: Colors.black87,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Spacer(),
                                    Icon(Icons.keyboard_arrow_right)
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  PaymentPage(
                                    cartName: widget.cartName,
                                payment: totalAmount(operation.cart),
                                  ),
                            ),
                      ),
                      child: Container(
                        height: (MediaQuery.of(context).size.height) * 0.12,
                        decoration: BoxDecoration(
                          color: Colors.white10,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Card(
                          elevation: 0.0,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Total Amount',
                                      style: GoogleFonts.openSans(
                                        textStyle: TextStyle(
                                          color: Colors.black87,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    Spacer(),
                                    Chip(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(8.0)),
                                      label: Text(
                                        'Rs ${totalAmount(operation.cart).toString()}',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 18),
                                      ),
                                      backgroundColor: Color.fromRGBO(133, 187, 101, 1),
                                    ),
                                    Icon(
                                      Icons.keyboard_arrow_right,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),],
              )),
            ],
          );
        },
      ),
    );
  }
}
