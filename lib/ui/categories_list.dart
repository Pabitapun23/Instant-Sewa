import 'package:flutter/material.dart';
import 'package:instantsewa/model/service_model.dart';
import 'package:instantsewa/state/category_state.dart';
import 'package:instantsewa/ui/sub_categories_page.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

// ignore: must_be_immutable
class CategoryList extends StatefulWidget {
  List<Service> category;
  CategoryList({this.category});

  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList>
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
    super.build(context);
    return Container(
      height: 120,
      alignment: Alignment.center,
      child: StateBuilder<CategoryState>(
        observe: () => _categoriesStateRM,
        builder: (context, model) {
          return ListView(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            children: [
              ...model.state.categories.map(
                (category) => Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    SubCategoriesPage(
                                      categoryIndex: category.categoryId,
                                      categoryName: category.categoryName,
                                    )));
                      },
                      child: Container(
                        width: 160,
                        child: Card(
                          semanticContainer: true,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          elevation: 5.0,
                          shadowColor: Colors.black38,
                          margin: EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Image.asset(
                                "${category.categoryImage}",
                                width: 70,
                                fit: BoxFit.fill,
                              ),
                              SizedBox(
                                height: 15.0,
                              ),
                              Divider(
                                color: Colors.black38,
                              ),
                              Text(
                                "${category.categoryName}",
                                style: TextStyle(fontSize: 16.0),
                              ),
                            ],
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
    );
  }

  @override
  bool get wantKeepAlive => true;
}
