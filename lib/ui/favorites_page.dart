import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instantsewa/model/provider_model.dart';
import 'package:instantsewa/services/service_providers_service.dart';
import 'package:instantsewa/ui/service_provider_details_page.dart';
import 'package:instantsewa/util/hexcode.dart';

class Favourites extends StatefulWidget {
  @override
  _FavouritesState createState() => _FavouritesState();
}

class _FavouritesState extends State<Favourites> {
  var provider = GetIt.instance<ServiceProvidersService>();
  List<Provider> items = [];
  @override
  void initState() {
    items = provider.addProvider();
    super.initState();
  }

  Widget build(BuildContext context) {
    Color _purple = HexColor('#603f8b');
    return Scaffold(
      appBar: AppBar(
        title: Text('Favourites'),
        backgroundColor: _purple,
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          shrinkWrap: true,
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) {
            var data = items[index];
            // var height = MediaQuery.of(context).size.height;
            var width = MediaQuery.of(context).size.width;
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            ServiceProviderDetailsPage(
                              index: index,
                            )));
              },
              child: Container(
                height: 500,
                decoration: BoxDecoration(
                  color: Colors.white10,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Card(
                  elevation: 5.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        data.image,
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
                        data.name,
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
                          itemCount: items[index].rate,
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
            );
          },
        ),
      ),
    );
  }
}
