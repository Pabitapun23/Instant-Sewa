import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:instantsewa/state/service_provider_state.dart';
import 'package:instantsewa/ui/payment_page.dart';
import 'package:instantsewa/util/hexcode.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class ServiceProviderDetailsPage extends StatefulWidget {
  final String index;
  const ServiceProviderDetailsPage({this.index});
  @override
  _ServiceProviderDetailsPageState createState() =>
      _ServiceProviderDetailsPageState();
}

class _ServiceProviderDetailsPageState extends State<ServiceProviderDetailsPage>
    with AutomaticKeepAliveClientMixin {
  Color _purple = HexColor('#603f8b');
  final _serviceProviderStateRM = RM.get<ServiceProviderState>();
  bool _like;
  bool _isLoading = false;
  @override
  void initState() {
    _isLoading = false;
    _serviceProviderStateRM.setState((profileState) async {
      profileState.getServiceProviderDetails(widget.index);
      _like = await profileState.getFavouriteServiceProvider(
          service_provider_id: widget.index);
    });
    _isLoading = true;
    super.initState();
  }

  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider Details'),
        backgroundColor: _purple,
      ),
      body: StateBuilder<ServiceProviderState>(
          observe: () => _serviceProviderStateRM,
          builder: (context, model) {
            return SingleChildScrollView(
                child: Column(
              children: <Widget>[
                ...model.state.provider.map((provider) {
                  return Column(
                    children: <Widget>[
                      (!_isLoading)
                          ? new Center(
                              child: new SizedBox(
                                height: 50.0,
                                width: 50.0,
                                child: new CircularProgressIndicator(
                                  value: null,
                                  strokeWidth: 7.0,
                                ),
                              ),
                            )
                          : Container(
                              width: width,
                              child: Stack(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(30.0),
                                    child: Container(
                                      height: height * 0.45,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: ExactAssetImage(
                                              'images/photos/provider.png'),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: width,
                                    margin: EdgeInsets.only(top: height * 0.45),
                                    padding: EdgeInsets.all(30.0),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(30),
                                        topRight: Radius.circular(30),
                                      ),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Icon(
                                              Icons.location_on,
                                              size: 30,
                                              color: Colors.black26,
                                            ),
                                            Expanded(
                                              child: Text(
                                                provider.address,
                                                style: TextStyle(
                                                    fontSize: 20.0,
                                                    color: Colors.black26),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          provider.fullName,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 25,
                                              color: Colors.black),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        RatingBarIndicator(
                                          rating: provider.rating,
                                          itemBuilder: (context, index) => Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          ),
                                          itemCount: 5,
                                          itemSize: 50.0,
                                          direction: Axis.horizontal,
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          'Details',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          provider.job,
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black54,
                                              letterSpacing: 0.5,
                                              wordSpacing: 1.5),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Center(
                                          child: RaisedButton(
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (BuildContext
                                                              context) =>
                                                          PaymentPage()));
                                            },
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(25.0),
                                            ),
                                            color: _purple,
                                            padding: EdgeInsets.fromLTRB(
                                                35, 12, 35, 12),
                                            child: Text(
                                              'Book Now',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 17.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    right: 25,
                                    top: height * 0.40,
                                    child: GestureDetector(
                                      onTap: () {
                                        _serviceProviderStateRM
                                            .setState((favouritestate) async {
                                          await favouritestate
                                              .setFavouriteServiceProvider(
                                                  $service_provider_id:
                                                      provider.id);
                                          _like = await favouritestate
                                              .getFavouriteServiceProvider(
                                                  service_provider_id:
                                                      provider.id);
                                        });
                                      },
                                      child: Container(
                                        height: 50,
                                        width: 50,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(35.0),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.black.withOpacity(0.5),
                                              blurRadius: 5,
                                              spreadRadius: 1,
                                            )
                                          ],
                                        ),
                                        child: Icon(
                                          Icons.favorite,
                                          size: 35,
                                          color: (_like)
                                              ? Colors.red[800]
                                              : Colors.grey[600],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                    ],
                  );
                })
              ],
            ));
          }),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
