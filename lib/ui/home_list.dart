import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instantsewa/model/provider_model.dart';
import 'package:instantsewa/model/service_model.dart';
import 'package:instantsewa/util/hexcode.dart';

class HomeList extends StatefulWidget {
  @override
  _HomeListState createState() => _HomeListState();
}

class _HomeListState extends State<HomeList> {
  Color _green = HexColor('#114817');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            _buildSlider(),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, top: 4.0),
                  child: Text(
                    'All Categories',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, top: 4.0),
                  child: FlatButton(
                    onPressed: () {},
                    child: Text(
                      'View All',
                      style: TextStyle(
                        color: _green,
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
                  padding: const EdgeInsets.only(left: 16.0, top: 4.0),
                  child: FlatButton(
                    onPressed: () {},
                    child: Text(
                      'View All',
                      style: TextStyle(
                        color: _green,
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
                  padding: const EdgeInsets.only(left: 16.0, top: 4.0),
                  child: FlatButton(
                    onPressed: () {},
                    child: Text(
                      'View All',
                      style: TextStyle(
                        color: _green,
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

// Widget _buildGridCategoriesList() {
//   return Scaffold(
//     body: GridView.count(
//       crossAxisCount: 3,
//       children: List.generate(9, (index) {
//         return Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Container(
//             decoration: BoxDecoration(
//                 image: DecorationImage(
//               image: AssetImage('images/photos/1(1).png'),
//             )),
//           ),
//         );
//       }),
//     ),
//   );
// }

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

Widget _buildSlider(){
return Container(
  child: Column(
       children: <Widget>[
         SizedBox(height: 15.0,),
         CarouselSlider(
           options: CarouselOptions(
             height: 180.0,
             enlargeCenterPage: true,
             autoPlay: true,
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
                   image: ExactAssetImage('images/photos/beauty1.jpg'),
                   fit: BoxFit.cover,
                 ),
               ),
               child: Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   crossAxisAlignment: CrossAxisAlignment.center,
                   children: <Widget>[
                     Text(
                       'Beauty Services At Home',
                       style: TextStyle(
                           color: Colors.white,
                           fontWeight: FontWeight.bold,
                           fontSize: 18.0),
                     ),
                   ]),
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
  var data2 = Service('Electrical', Icons.lightbulb_outline);
  list.add(data2);
  var data3 = Service('Carpenting', Icons.local_gas_station);
  list.add(data3);
  var data4 = Service('Painting', Icons.format_paint);
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
