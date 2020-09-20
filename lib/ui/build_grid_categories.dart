import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instantsewa/model/service_model.dart';
import 'package:instantsewa/ui/sub_categories_page.dart';

// ignore: must_be_immutable
class BulidGridCategory extends StatelessWidget {
  List<Service> category;
  BulidGridCategory(this.category);
  @override
  Widget build(BuildContext context) {
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
        children: category.map((data) {
          return Material(
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            SubCategoriesPage()));
              },
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
}
