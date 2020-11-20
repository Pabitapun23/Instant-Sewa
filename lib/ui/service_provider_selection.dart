import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instantsewa/model/provider_model.dart';
import 'package:instantsewa/services/service_providers_service.dart';
import 'package:instantsewa/state/service_provider_selection_state.dart';
import 'package:instantsewa/ui/booking_page.dart';
import 'package:instantsewa/ui/service_provider_details_page.dart';
import 'package:instantsewa/util/hexcode.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class ServiceProviderSelection extends StatefulWidget {
  final String subCategoryName,
      latitude,
      longitude,
      startDate,
      endDate,
      address;
  final List<String> cartList;

  const ServiceProviderSelection(
      {Key key,
      this.subCategoryName,
      this.latitude,
      this.longitude,
      this.startDate,
      this.endDate,
      this.cartList,
      this.address})
      : super(key: key);

  @override
  _ServiceProviderSelectionState createState() =>
      _ServiceProviderSelectionState();
}

class _ServiceProviderSelectionState extends State<ServiceProviderSelection>
    with AutomaticKeepAliveClientMixin {
  Color _purple = HexColor('#603f8b');
  var provider = GetIt.instance<ServiceProvidersService>();
  final _serviceProviderSelectionState =
      RM.get<ServiceProviderSelectionState>();
  bool _isLoading = false;
  List<Provider> items = [];

  @override
  void initState() {
    _serviceProviderSelectionState.setState((serviceProviderState) =>
        serviceProviderState.getServiceProviderInformationByDistance(
          subCategoryName: widget.subCategoryName,
          latitude: widget.latitude,
          longitude: widget.longitude,
          startTime: widget.startDate,
          endTime: widget.endDate,
        ));
    _isLoading = false;
    items = provider.addProvider();
    super.initState();
  }

  Widget build(BuildContext context) {
    super.build(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Choose Service Provider'),
          backgroundColor: _purple,
          bottom: TabBar(
            indicatorColor: Colors.white,
            indicatorWeight: 3.0,
            unselectedLabelColor: Colors.grey[400],
            labelStyle: TextStyle(fontSize: 17.0, fontWeight: FontWeight.w500),
            tabs: [
              Tab(
                text: 'Top Providers',
              ),
              Tab(
                text: 'Nearby Providers',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                var data = items[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => BookingPage(
                                  index: index.toString(),
                                )));
                  },
                  child: Container(
                    height: (MediaQuery.of(context).size.height) * 0.15,
                    decoration: BoxDecoration(
                      color: Colors.white10,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Card(
                      elevation: 5.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Image.asset(
                            data.image,
                            width: 75,
                            fit: BoxFit.contain,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                data.name,
                                style: GoogleFonts.openSans(
                                  textStyle: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                height: 30,
                                width:
                                    (MediaQuery.of(context).size.width) * 0.2,
                                child: ListView.builder(
                                  itemCount: data.rate,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return Icon(
                                      Icons.star,
                                      color: Colors.yellow[500],
                                      size: 17,
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                          Icon(
                            Icons.keyboard_arrow_right,
                            size: 30,
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
            StateBuilder<ServiceProviderSelectionState>(
                observe: () => _serviceProviderSelectionState,
                builder: (context, model) {
                  return ListView(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    children: [
                      ...model.state.providers.map(
                        (serviceProvider) => Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        BookingPage(
                                      index: serviceProvider.id,
                                      address: widget.address,
                                      latitude: widget.latitude,
                                      longitude: widget.longitude,
                                      cartList: widget.cartList,
                                      endDate: widget.endDate,
                                      startDate: widget.startDate,
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                height:
                                    (MediaQuery.of(context).size.height) * 0.15,
                                decoration: BoxDecoration(
                                  color: Colors.white10,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Card(
                                  elevation: 5.0,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Image.asset(
                                        'images/photos/provider.png',
                                        width: 75,
                                        fit: BoxFit.contain,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            serviceProvider.userName,
                                            style: GoogleFonts.openSans(
                                              textStyle: TextStyle(
                                                color: Colors.black54,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                          Text(
                                              '${serviceProvider.distance} miles away'),
                                        ],
                                      ),
                                      Icon(
                                        Icons.keyboard_arrow_right,
                                        size: 30,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }),
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
