import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:instantsewa/model/provider_model.dart';
import 'package:instantsewa/services/service_providers_service.dart';
import 'package:instantsewa/util/hexcode.dart';

class ServiceProviderDetailsPage extends StatefulWidget {
  final index;

  const ServiceProviderDetailsPage({Key key, this.index}) : super(key: key);
  @override
  _ServiceProviderDetailsPageState createState() =>
      _ServiceProviderDetailsPageState();
}

class _ServiceProviderDetailsPageState
    extends State<ServiceProviderDetailsPage> {
  Color _purple = HexColor('#603f8b');
  bool _like = false;
  var provider = GetIt.instance<ServiceProvidersService>();
  List<Provider> serviceprovider = [];
  @override
  void initState() {
    serviceprovider = provider.addProvider();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: width,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Container(
                  height: height * 0.45,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image:
                          ExactAssetImage(serviceprovider[widget.index].image),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.location_on,
                          size: 30,
                          color: Colors.black26,
                        ),
                        Text(
                          'address',
                          style:
                              TextStyle(fontSize: 20.0, color: Colors.black26),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      serviceprovider[widget.index].name,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 50,
                      width: width,
                      child: ListView.builder(
                        itemCount: serviceprovider[widget.index].rate,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Icon(
                            Icons.star,
                            color: Colors.yellow[500],
                            size: 30,
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Details',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      serviceprovider[widget.index].desc,
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
                        onPressed: () {},
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        color: _purple,
                        padding: EdgeInsets.fromLTRB(35, 12, 35, 12),
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
                top: height * 0.05,
                left: 15,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.keyboard_backspace,
                    size: 30,
                    color: Colors.black,
                  ),
                ),
              ),
              Positioned(
                right: 25,
                top: height * 0.40,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _like = !_like;
                    });
                  },
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(35.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          blurRadius: 5,
                          spreadRadius: 1,
                        )
                      ],
                    ),
                    child: Icon(
                      Icons.favorite,
                      size: 35,
                      color: (_like) ? Colors.red[800] : Colors.grey[600],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
