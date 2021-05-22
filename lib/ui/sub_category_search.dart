import 'package:dio/dio.dart';
import 'package:instantsewa/application/InstantSewa_api.dart';
import 'package:instantsewa/application/classes/errors/common_error.dart';
import 'package:instantsewa/application/storage/localstorage.dart';
import 'package:instantsewa/application/storage/storage_keys.dart';
import 'package:instantsewa/util/hexcode.dart';
import 'package:flutter/material.dart';
import 'package:instantsewa/widgets/sub_sub_category_image.dart';
import 'package:instantsewa/widgets/sub_sub_category_list.dart';

class SubSearchPage extends StatefulWidget {
  final String subCategoryName;
  const SubSearchPage({Key key, this.subCategoryName}) : super(key: key);

  @override
  _SubSearchPageState createState() => _SubSearchPageState();
}
String image=null,id=null;
void findSubCategoryImage(String name) async{
  try {
    Response response = await InstantSewaAPI.dio.post("/subcategoryImageFinder",
        data: {"name": name},
        options: Options(headers: {
          'Authorization': "Bearer ${LocalStorage.getItem(TOKEN)}"
        }));
    id=response.data[0]['id'].toString();
    image = response.data[0]['image'];
  } on DioError catch (e) {
    throw showNetworkError(e);
  }
}
class _SubSearchPageState extends State<SubSearchPage> {
  @override
  void initState(){
    findSubCategoryImage(widget.subCategoryName);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Color _purple = HexColor('#603f8b');
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.subCategoryName),
        backgroundColor: _purple,
      ),
      body: Container(
        child: Stack(
          children: [
            Container(
              child: ListView(children: [
                image!=null? SubSubCategoryImage(
                    subCategoryImage: image,
                  ):CircularProgressIndicator(key: widget.key,),
                id!=null? SubSubCategoryList(id, widget.subCategoryName):CircularProgressIndicator(key: widget.key,),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
