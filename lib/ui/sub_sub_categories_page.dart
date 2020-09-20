import 'package:instantsewa/model/sub_categories_model.dart';
import 'package:instantsewa/util/hexcode.dart';
import 'package:flutter/material.dart';

class SubSubCategoriesPage extends StatelessWidget {
  final String subCategoriesName;
  final SubCategories subCategories;

  const SubSubCategoriesPage(
      {Key key, this.subCategoriesName, this.subCategories})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    Color _purple = HexColor('#603f8b');
    return Scaffold(
      appBar: AppBar(
        title: Text('$subCategoriesName'),
        backgroundColor: _purple,
      ),
      body: Container(
        child: Stack(
          children: [
            Container(
              child: ListView(children: [
                ImageBox(
                  imageBox: subCategories.img,
                ),
                SubSubCategoriesList(
                  subSubCategoriesImage: subCategories.img,
                  subSubCategoriesList: subCategories.subSubCategories,
                  subSubCategoriesPrice: subCategories.price,
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }
}

class ImageBox extends StatelessWidget {
  final String imageBox;

  const ImageBox({Key key, this.imageBox}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: ExactAssetImage(
              imageBox,
            ),
            fit: BoxFit.contain),
      ),
    );
  }
}

class SubSubCategoriesList extends StatelessWidget {
  final List<String> subSubCategoriesList;
  final String subSubCategoriesImage;
  final List<String> subSubCategoriesPrice;
  const SubSubCategoriesList(
      {Key key,
      this.subSubCategoriesList,
      this.subSubCategoriesImage,
      this.subSubCategoriesPrice})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    Color _purple = HexColor('#603f8b');
    return ListView.builder(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      itemCount: subSubCategoriesList.length,
      itemBuilder: (context, index) {
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
                      subSubCategoriesImage,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              title: Text(
                subSubCategoriesList[index],
                style: TextStyle(fontSize: 17.0),
              ),
              subtitle: Text(
                'Starting from:${subSubCategoriesPrice[index]}',
                style: TextStyle(fontSize: 13.0),
              ),
              trailing: OutlineButton(
                onPressed: () {},
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
