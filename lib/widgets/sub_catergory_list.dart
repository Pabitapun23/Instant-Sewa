import 'package:flutter/material.dart';
import 'package:instantsewa/providers/categories.dart';
import 'package:instantsewa/ui/sub_sub_categories_page.dart';
import 'package:provider/provider.dart';

class SubCategoriesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final serviceData = Provider.of<Categories>(context);
    final service = serviceData.services;
    return ListView.builder(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      itemCount: service.length,
      itemBuilder: (context, subCategoriesIndex) {
        var data = service[subCategoriesIndex];
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
                data.subCategories,
                style: TextStyle(fontSize: 20.0),
              ),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => SubSubCategoriesPage(
                              subCategoryIndex: subCategoriesIndex,
                            )));
              },
            ),
          ),
        );
      },
    );
  }
}
