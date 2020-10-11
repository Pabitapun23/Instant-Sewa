import 'package:instantsewa/model/sub_categories_model.dart';
import 'package:instantsewa/ui/sub_sub_categories_page.dart';
import 'package:instantsewa/util/hexcode.dart';
import 'package:flutter/material.dart';

class SubCategoriesPage extends StatelessWidget {
  final List<SubCategories> subCategoriesList =
      SubCategories.getSubCategories();
  @override
  Widget build(BuildContext context) {
    Color _purple = HexColor('#603f8b');
    return Scaffold(
      appBar: AppBar(
        title: Text('Electrical Services'),
        backgroundColor: _purple,
      ),
      body: Container(
        child: ListView(children: [
          _buildSubCategoriesList(),
        ]),
      ),
    );
  }

  Widget _buildSubCategoriesList() {
    var subCategories = subCategoriesList;
    return ListView.builder(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      itemCount: subCategories.length,
      itemBuilder: (context, key) {
        var data = subCategories[key];
        return Container(
          padding: EdgeInsets.only(top: 10.0),
          height: 70,
          child: Card(
            margin: EdgeInsets.symmetric(vertical: 0.0, horizontal: 5.0),
            elevation: 0.5,
            child: ListTile(
              leading: CircleAvatar(
                radius: 29.0,
                child: ClipRRect(
                  child: SizedBox(
                    width: 100.0,
                    height: 100.0,
                    child: Image.asset(
                      data.img,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              title: Text(
                data.name,
                style: TextStyle(fontSize: 20.0),
              ),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => SubSubCategoriesPage(
                              subCategoriesName: subCategoriesList[key].name,
                              subCategories: subCategories[key],
                              subCategoryIndex: key,
                            )));
              },
            ),
          ),
        );
      },
    );
  }
}
