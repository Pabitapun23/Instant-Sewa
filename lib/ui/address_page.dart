import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:instantsewa/router/route_constants.dart';
import 'package:instantsewa/ui/schedule_page.dart';
import 'package:instantsewa/util/hexcode.dart';
import 'package:search_map_place/search_map_place.dart';

class AddressPage extends StatefulWidget {
  final String subCategoryName;
  final List<String> cartList;

  const AddressPage({Key key, this.cartList, this.subCategoryName})
      : super(key: key);
  @override
  _AddressPageState createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  GoogleMapController _controller;
  Position position;
  Widget _child;
  String address;

  Set<Marker> _markers = {};

  @override
  void initState() {
    _getCurrentLocation();
    super.initState();
  }

  void _getCurrentLocation() async {
    Position res = await Geolocator.getCurrentPosition();
    setState(() {
      position = res;
      _child = _mapWidget();
    });
  }

  Color _purple = HexColor('#603f8b');

  Widget _mapWidget() {
    return GoogleMap(
      mapType: MapType.normal,
      initialCameraPosition: CameraPosition(
        zoom: 15.0,
        target: LatLng(position.latitude, position.longitude),
      ),
      markers: _markers,
      myLocationButtonEnabled: true,
      onMapCreated: (GoogleMapController googleMapController) {
        setState(
          () {
            _controller = googleMapController;
            _markers.add(
              Marker(
                draggable: true,
                markerId: MarkerId("1"),
                position: LatLng(position.latitude, position.longitude),
                icon: BitmapDescriptor.defaultMarker,
                infoWindow: const InfoWindow(title: 'My Current Location'),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Address Details'),
        backgroundColor: _purple,
      ),
      backgroundColor: Colors.white,
      body: position == null
          ? Center(
              child: SizedBox(
                height: 50.0,
                width: 50.0,
                child: CircularProgressIndicator(
                    value: null,
                    strokeWidth: 7.0,
                    backgroundColor: Colors.deepPurple,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white)),
              ),
            )
          : SafeArea(
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
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 25,
                        ),
                        Text(
                          "Give us your address below.",
                          style: TextStyle(
                              color: Color.fromRGBO(49, 39, 79, .6),
                              fontSize: 17.0),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SearchMapPlaceWidget(
                          placeholder: 'Enter your address',
                          placeType: PlaceType.address,
                          hasClearButton: true,
                          apiKey: 'AIzaSyBUILBxCa5yyQZawAAOpD6HII48R3haimM',
                          onSelected: (Place place) async {
                            address = place.description;
                            Geolocation geolocation = await place.geolocation;
                            _controller.animateCamera(
                              CameraUpdate.newLatLng(geolocation.coordinates),
                            );
                            _controller.animateCamera(
                              CameraUpdate.newLatLngBounds(
                                  geolocation.bounds, 0),
                            );
                            _markers.add(
                              Marker(
                                draggable: true,
                                markerId: MarkerId("2"),
                                position: geolocation.coordinates,
                                icon: BitmapDescriptor.defaultMarker,
                                infoWindow: const InfoWindow(
                                    title: 'My Current Location'),
                              ),
                            );
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(height: 350.0, child: _mapWidget()),
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.4,
                            height: 45.0,
                            child: RaisedButton(
                              color: _purple,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25.0)),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        SchedulePage(
                                      cartList: widget.cartList,
                                      subCategoryName: widget.subCategoryName,
                                      latitude: position.latitude.toString(),
                                      longitude: position.longitude.toString(),
                                      address: address,
                                    ),
                                  ),
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 14.0, vertical: 12.0),
                                child: Text(
                                  'Next',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 17.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
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
