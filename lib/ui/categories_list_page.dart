import 'package:flutter/material.dart';
import 'package:instantsewa/model/service_model.dart';
import 'package:instantsewa/state/category_state.dart';
import 'package:instantsewa/ui/sub_categories_page.dart';
import 'package:instantsewa/util/hexcode.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

// ignore: must_be_immutable
class AllCategoryList extends StatefulWidget {
  List<Service> category;
  AllCategoryList({this.category});

  @override
  _AllCategoryListState createState() => _AllCategoryListState();
}

class _AllCategoryListState extends State<AllCategoryList>
    with AutomaticKeepAliveClientMixin {
  final _categoriesStateRM = RM.get<CategoryState>();

  @override
  void initState() {
    _categoriesStateRM
        .setState((categoryState) => categoryState.getAllCategories());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Color _purple = HexColor('#603f8b');
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('All Services'),
        backgroundColor: _purple,
      ),
      body: Container(
        child: StateBuilder<CategoryState>(
          observe: () => _categoriesStateRM,
          builder: (context, model) {
            return ListView(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              children: [
                ...model.state.categories.map(
                  (category) => Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 10.0),
                        height: 70,
                        child: Card(
                          margin: EdgeInsets.symmetric(
                              vertical: 0.0, horizontal: 5.0),
                          elevation: 0.5,
                          child: ListTile(
                            leading: CircleAvatar(
                              radius: 29.0,
                              backgroundColor: Colors.white,
                              child: ClipRRect(
                                child: SizedBox(
                                  width: 50.0,
                                  height: 30.0,
                                  child: Image.asset(
                                    "${category.categoryImage}",
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                            title: Text(
                              "${category.categoryName}",
                              style: TextStyle(fontSize: 20.0),
                            ),
                            trailing: Icon(Icons.keyboard_arrow_right),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      SubCategoriesPage(
                                    categoryIndex: category.categoryId,
                                    categoryName: category.categoryName,
                                  ),
                                ),
                              );
                            },
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
  bool get wantKeepAlive => true;
}
