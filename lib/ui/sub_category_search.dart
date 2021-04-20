import 'package:instantsewa/application/InstantSewa_api.dart';
import 'package:instantsewa/state/sub_category_state.dart';
import 'package:instantsewa/util/hexcode.dart';
import 'package:flutter/material.dart';
import 'package:instantsewa/widgets/sub_sub_category_image.dart';
import 'package:instantsewa/widgets/sub_sub_category_list.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class SubSearchPage extends StatefulWidget {
  final String subCategoryName;

  const SubSearchPage({Key key, this.subCategoryName}) : super(key: key);

  @override
  _SubSearchPageState createState() => _SubSearchPageState();
}

class _SubSearchPageState extends State<SubSearchPage>
    with AutomaticKeepAliveClientMixin {
  final _subCategoryStateRM = RM.get<SubCategoryState>();
  @override
  void initState() {
    _subCategoryStateRM.setState((subCategoryState) =>
        subCategoryState.getSubCategoryData(widget.subCategoryName));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    Color _purple = HexColor('#603f8b');
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.subCategoryName),
        backgroundColor: _purple,
      ),
      body: StateBuilder<SubCategoryState>(
        observe: () => _subCategoryStateRM,
        builder: (context, model) {
          return Container(
            child: Stack(
              children: [
                ...model.state.subCategoryFinder.map(
                  (subCategory) => Column(
                    children: [
                      Container(
                        child: ListView(children: [
                          // SubSubCategoryImage(
                          // subCategoryImage: subCategory.subCategoryImage,
                          //),
                          //SubSubCategoryList('1', widget.subCategoryName),
                        ]),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
