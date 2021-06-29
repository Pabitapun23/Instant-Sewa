import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:instantsewa/base_url.dart';
import 'package:instantsewa/util/hexcode.dart';
import 'package:instantsewa/webview/chrome_safari_browser_example.dart';
import 'package:instantsewa/webview/in_app_browser_example.dart';

class PaymentPage extends StatefulWidget {
  final String cartName;
  final double payment;
  const PaymentPage({Key key, this.payment, this.cartName}) : super(key: key);

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final ChromeSafariBrowserExample chromeSafariBrowserExample =
  ChromeSafariBrowserExample(InAppBrowserExample());
  @override
  void initState() {
    print(widget.payment);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Color _purple = HexColor('#603f8b');
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment'),
        backgroundColor: _purple,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Container(
              height: 100,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    bottom: 20,
                    left: 0,
                    child: Image.asset(
                      "images/main_top.png",
                      width: size.width * 0.50,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Center(
                      child: Text(
                        "How do you want to pay?",
                        style: TextStyle(
                          color: Color.fromRGBO(49, 39, 79, .7),
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
//
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Center(
                        child: SizedBox(
                          width: 225,
                          child: RaisedButton(
                            elevation: 0.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            padding: EdgeInsets.only(
                                top: 4.0, bottom: 4.0, right: 40.0, left: 7.0),
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  radius: 20.0,
                                  backgroundColor: Colors.white,
                                  child: ClipRect(
                                    child: Image.asset(
                                      "images/photos/cash.png",
                                      height: 30.0,
                                      width: 30.0,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 10.0),
                                  child: Text(
                                    "Cash",
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            ),
                            textColor: Colors.white,
                            color: Colors.green,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 13.0,
                      ),
                      Center(
                        child: SizedBox(
                          width: 225,
                          child: RaisedButton(
                            elevation: 0.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            padding: EdgeInsets.only(
                                top: 4.0, bottom: 4.0, right: 40.0, left: 7.0),
                            onPressed: () {
                              chromeSafariBrowserExample.open(
                                url: BASE_URL+'/payment/'+widget.cartName+'/'+widget.payment.toString(),
                                options: ChromeSafariBrowserClassOptions(
                                  android: AndroidChromeCustomTabsOptions(
                                    addDefaultShareMenuItem: true,
                                    enableUrlBarHiding: true,
                                    instantAppsEnabled: true,
                                    keepAliveEnabled: true,
                                    showTitle: true,
                                  ),
                                  ios: IOSSafariOptions(

                                  ),
                                ),
                              );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  radius: 20.0,
                                  backgroundColor: Colors.white,
                                  child: ClipRect(
                                    child: Image.asset(
                                      "images/photos/paypal.png",
                                      height: 30.0,
                                      width: 30.0,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 10.0),
                                  child: Text(
                                    "PayPal",
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            ),
                            textColor: Colors.white,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 13.0,
                      ),
                      Center(
                        child: SizedBox(
                          width: 225,
                          child: RaisedButton(
                            elevation: 0.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            padding: EdgeInsets.only(
                                top: 4.0, bottom: 4.0, right: 40.0, left: 7.0),
                            onPressed: () {
                              chromeSafariBrowserExample.open(
                                url: BASE_URL+'/khalti/'+widget.cartName+'/'+widget.payment.toString(),
                                options: ChromeSafariBrowserClassOptions(
                                  android: AndroidChromeCustomTabsOptions(
                                    addDefaultShareMenuItem: true,
                                    enableUrlBarHiding: true,
                                    instantAppsEnabled: true,
                                    keepAliveEnabled: true,
                                    showTitle: true,
                                  ),
                                  ios: IOSSafariOptions(

                                  ),
                                ),
                              );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  radius: 20.0,
                                  backgroundColor: Colors.white,
                                  child: ClipRect(
                                    child: Image.asset(
                                      "images/photos/khalti.png",
                                      height: 37.0,
                                      width: 37.0,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Text(
                                    "Khalti",
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            ),
                            textColor: Colors.white,
                            color: Colors.deepPurple,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
