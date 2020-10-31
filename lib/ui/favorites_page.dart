import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instantsewa/model/provider_model.dart';
import 'package:instantsewa/router/route_constants.dart';
import 'package:instantsewa/services/service_providers_service.dart';
import 'package:instantsewa/state/favourite_state.dart';
import 'package:instantsewa/ui/service_provider_details_page.dart';
import 'package:instantsewa/util/hexcode.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class Favourites extends StatefulWidget {
  @override
  _FavouritesState createState() => _FavouritesState();
}

class _FavouritesState extends State<Favourites>
    with AutomaticKeepAliveClientMixin {
  final _favouriteStateRM = RM.get<FavouriteState>();
  @override
  void initState() {
    _favouriteStateRM.setState(
        (profileState) => profileState.getAllFavouriteServiceProvider());
    super.initState();
  }

  Widget build(BuildContext context) {
    super.build(context);
    var width = MediaQuery.of(context).size.width;
    Color _purple = HexColor('#603f8b');
    return Scaffold(
      appBar: AppBar(
        title: Text('Favourites'),
        backgroundColor: _purple,
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushNamed(context, homeRoute);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: StateBuilder<FavouriteState>(
          observe: () => _favouriteStateRM,
          builder: (context, model) {
            return GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: MediaQuery.of(context).size.width /
                    (MediaQuery.of(context).size.height / 1.5),
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 3.0,
              ),
              shrinkWrap: true,
              children: [
                ...model.state.providers.map(
                  (user) => Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      ServiceProviderDetailsPage(
                                        index: user.id,
                                      )));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white10,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Card(
                              elevation: 5.0,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Image.asset(
                                      'images/photos/provider.png',
                                      width: 90,
                                      fit: BoxFit.cover,
                                    ),
                                    SizedBox(
                                      height: 16,
                                    ),
                                    Divider(
                                      color: Colors.black26,
                                    ),
                                    Text(
                                      user.fullName,
                                      style: GoogleFonts.openSans(
                                        textStyle: TextStyle(
                                          color: Colors.black54,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      height: 30,
                                      width: width * 0.2,
                                      child: ListView.builder(
                                        itemCount: user.rating,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) {
                                          return Icon(
                                            Icons.star,
                                            color: Colors.yellow[500],
                                            size: 17,
                                          );
                                        },
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  @override
// TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
