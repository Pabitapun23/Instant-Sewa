import 'package:instantsewa/model/grid_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instantsewa/model/provider_model.dart';
import 'package:instantsewa/model/service_model.dart';
import 'package:instantsewa/util/hexcode.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeList extends StatefulWidget {
  @override
  _HomeListState createState() => _HomeListState();
}

class _HomeListState extends State<HomeList> {
  Color _purple = HexColor('#603f8b');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white38,
        child: ListView(
          children: <Widget>[
            _buildSlider(),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, top: 14.0),
                  child: Text(
                    'All Services',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            _buildGridCategoriesList(),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, top: 4.0),
                  child: Text(
                    'Popular Services',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 125.0, top: 4.0),
                  child: FlatButton(
                    onPressed: () {},
                    child: Text(
                      'View All',
                      style: TextStyle(
                        color: _purple,
                      ),
                    ),
                  ),
                )
              ],
            ),
            _buildCategoriesList(),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, top: 4.0),
                  child: Text(
                    'Featured Service Providers',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 60.0, top: 4.0),
                  child: FlatButton(
                    onPressed: () {},
                    child: Text(
                      'View All',
                      style: TextStyle(
                        color: _purple,
                      ),
                    ),
                  ),
                )
              ],
            ),
            _buildProviderList(),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, top: 4.0),
                  child: Text(
                    'Recommendation',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 135.0, top: 4.0),
                  child: FlatButton(
                    onPressed: () {},
                    child: Text(
                      'View All',
                      style: TextStyle(
                        color: _purple,
                      ),
                    ),
                  ),
                )
              ],
            ),
            _buildProviderList(),
          ],
        ),
      ),
    );
  }
}

Widget _buildGridCategoriesList() {
  var items = addGridList();
  return Container(
    margin: EdgeInsets.only(top: 14),
    color: Colors.white10,
    height: 290,
    alignment: Alignment.centerLeft,
    child: GridView.count(
      crossAxisCount: 3,
      childAspectRatio: 4 / 3,
      padding: EdgeInsets.only(left: 16, right: 16),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      shrinkWrap: true,
      children: items.map((data) {
        return Material(
          child: InkWell(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white10,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    data.img,
                    width: 50,
                  ),
                  SizedBox(
                    height: 16,
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
                ],
              ),
            ),
          ),
        );
      }).toList(),
    ),
  );
}

Widget _buildCategoriesList() {
  var items = addServices();
  return Container(
    height: 150,
    alignment: Alignment.centerLeft,
    child: ListView.builder(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      itemCount: items.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        var data = items[index];
        return Column(
          children: <Widget>[
            Container(
              width: 95,
              height: 95,
              alignment: Alignment.center,
              margin: EdgeInsets.all(10.0),
              child: Icon(
                data.icon,
                size: 40,
                color: Colors.black38,
              ),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12.withOpacity(0.5),
                      offset: Offset(0, 5),
                      blurRadius: 15,
                    )
                  ]),
            ),
            Row(
              children: <Widget>[
                Text(data.name),
                Icon(
                  Icons.keyboard_arrow_right,
                  size: 14,
                ),
              ],
            )
          ],
        );
      },
    ),
  );
}

_buildProviderList() {
  var items = addProvider();
  return Container(
    height: 200,
    alignment: Alignment.centerLeft,
    child: ListView.builder(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      itemCount: items.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        var data = items[index];
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              width: 130,
              height: 100,
              alignment: Alignment.center,
              margin: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.white,
                  image: DecorationImage(
                    image: ExactAssetImage('images/flag.png'),
                    fit: BoxFit.cover,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0, 5),
                      blurRadius: 10,
                    )
                  ]),
            ),
            Container(
              width: 130,
              alignment: Alignment.centerLeft,
              child: Text(
                data.name,
                style: TextStyle(fontSize: 14, color: Colors.black),
              ),
            ),
            Container(
              width: 130,
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 4.0, top: 4.0),
              child: Text(
                'Pricing',
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        );
      },
    ),
  );
}

Widget _buildSlider() {
  return Container(
    child: Column(
      children: <Widget>[
        SizedBox(height: 15.0),
        CarouselSlider(
          options: CarouselOptions(
            height: 180.0,
            autoPlay: false,
            aspectRatio: 16 / 9,
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: Duration(milliseconds: 800),
          ),
          items: [
            Container(
              margin: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  image: ExactAssetImage('images/photos/beauty2.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  image: ExactAssetImage('images/photos/cleaning1.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  image: ExactAssetImage('images/photos/plumbing.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  image: ExactAssetImage('images/photos/electrician.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            )
          ],
        )
      ],
    ),
  );
}

List<Service> addServices() {
  var list = List<Service>();
  var data1 = Service('Plumbing', Icons.person);
  list.add(data1);
  var data2 = Service('Electrical', Icons.person);
  list.add(data2);
  var data3 = Service('Carpenting', Icons.person);
  list.add(data3);
  var data4 = Service('Painting', Icons.person);
  list.add(data4);

  return list;
}

List<Provider> addProvider() {
  var list = List<Provider>();
  var data1 = Provider('Plumbing', Image.asset('flag'));
  list.add(data1);
  var data2 = Provider('Electrical', Image.asset('flag'));
  list.add(data2);
  var data3 = Provider('Carpenting', Image.asset('flag'));
  list.add(data3);
  var data4 = Provider('Painting', Image.asset('flag'));
  list.add(data4);

  return list;
}

List<GridList> addGridList() {
  var list = List<GridList>();
  var data1 = GridList('images/photos/electric.png', 'Electrical');
  list.add(data1);
  var data2 = GridList('images/photos/painting1.png', 'Painting');
  list.add(data2);
  var data3 = GridList('images/photos/plumb.png', 'Plumbing');
  list.add(data3);
  var data4 = GridList('images/photos/beautician.png', 'Beauty');
  list.add(data4);
  var data5 = GridList('images/photos/clean2.png', 'Cleaning');
  list.add(data5);
  var data6 = GridList('images/photos/appliance1.png', 'Appliances');
  list.add(data6);
  var data7 = GridList('images/photos/laundry.png', 'Laundry');
  list.add(data7);
  var data8 = GridList('images/photos/tvMounting.png', 'Tv mounting');
  list.add(data8);
  var data9 = GridList('images/photos/plumb1.png', 'Handyman');
  list.add(data9);

  return list;
}
