import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instantsewa/router/route_constants.dart';
import 'package:instantsewa/state/category_state.dart';
import 'package:instantsewa/ui/sub_categories_page.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

// ignore: must_be_immutable
class BuildGridCategory extends StatefulWidget {
  @override
  _BuildGridCategoryState createState() => _BuildGridCategoryState();
}

class _BuildGridCategoryState extends State<BuildGridCategory>
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
      child: StateBuilder<CategoryState>(
        observe: () => _categoriesStateRM,
        builder: (context, model) {
          return GridView(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: MediaQuery.of(context).size.width /
                  (MediaQuery.of(context).size.height / 2.4),
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
            ),
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.only(left: 16, right: 16),
            shrinkWrap: true,
            children: <Widget>[
              ...model.state.categories
                  .map((category) => Column(children: <Widget>[
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
                            decoration: BoxDecoration(
                              color: Colors.white10,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset(
                                  "${category.categoryImage}",
                                  width: 50,
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                Text(
                                  "${category.categoryName}",
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
                        )
                      ]))
            ],
          );
        },
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
