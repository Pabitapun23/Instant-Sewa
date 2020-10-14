import 'package:flutter/material.dart';
import 'package:instantsewa/ui/sub_sub_categories_details_page.dart';
import 'package:instantsewa/util/hexcode.dart';
import 'package:provider/provider.dart';
import '../providers/categories.dart';

class SubSubCategoryList extends StatelessWidget {
  final int subCategoryIndex;

  const SubSubCategoryList({Key key, this.subCategoryIndex}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final serviceData = Provider.of<Categories>(context);
    final service = serviceData.services[subCategoryIndex].subSubCategories;
    final img = serviceData.services[subCategoryIndex].subSubCategoriesImage;
    final price = serviceData.services[subCategoryIndex].price;

    Color _purple = HexColor('#603f8b');
    return ListView.builder(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      itemCount: service.length,
      itemBuilder: (context, subSubCategoryIndex) {
        return Container(
          padding: EdgeInsets.only(top: 8.0),
          height: 80,
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
                      img[subSubCategoryIndex],
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              title: Text(
                service[subSubCategoryIndex],
                style: TextStyle(fontSize: 17.0),
              ),
              subtitle: Text(
                'Starting from:\$${price[subSubCategoryIndex]}',
                style: TextStyle(fontSize: 13.0),
              ),
              trailing: OutlineButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              SubSubCategoriesDetailsPage(
                                subSubCategoryIndex: subSubCategoryIndex,
                                subCategoryIndex: subCategoryIndex,
                              )));
                },
                child: Text(
                  'Add',
                  style: TextStyle(color: _purple, fontSize: 16.0),
                ),
                borderSide: BorderSide(color: _purple),
              ),
            ),
          ),
        );
      },
    );
  }
}
