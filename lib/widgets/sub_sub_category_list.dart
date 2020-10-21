import 'package:flutter/material.dart';
import 'package:instantsewa/state/service_state.dart';
import 'package:instantsewa/ui/sub_sub_categories_details_page.dart';
import 'package:instantsewa/util/hexcode.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

// ignore: must_be_immutable
class SubSubCategoryList extends StatefulWidget {
  String id;
  final String subCategoryName;
  SubSubCategoryList(this.id, this.subCategoryName);

  @override
  _SubSubCategoryListState createState() =>
      _SubSubCategoryListState(subCategoryName);
}

class _SubSubCategoryListState extends State<SubSubCategoryList>
    with AutomaticKeepAliveClientMixin {
  final String subCategoryName;
  final _servicesStateRM = RM.get<ServiceState>();

  _SubSubCategoryListState(this.subCategoryName);
  @override
  void initState() {
    _servicesStateRM
        .setState((serviceState) => serviceState.getAllServices(widget.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    Color _purple = HexColor('#603f8b');
    return Container(
      child: StateBuilder<ServiceState>(
        observe: () => _servicesStateRM,
        builder: (context, model) {
          return ListView(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            children: [
              ...model.state.services.map(
                (service) => Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 8.0),
                      height: 80,
                      child: Card(
                        margin: EdgeInsets.symmetric(
                            vertical: 0.0, horizontal: 5.0),
                        elevation: 0.5,
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 29.0,
                            child: ClipRRect(
                              child: SizedBox(
                                width: 100.0,
                                height: 100.0,
                                child: Image.asset(
                                  '${service.serviceImage}',
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                          title: Text(
                            '${service.serviceName}',
                            style: TextStyle(fontSize: 17.0),
                          ),
                          subtitle: Text(
                            'Starting from:\$${service.servicePrice}',
                            style: TextStyle(fontSize: 13.0),
                          ),
                          trailing: OutlineButton(
                            onPressed: () {
//                              Navigator.push(
//                                  context,
//                                  MaterialPageRoute(
//                                      builder: (BuildContext context) =>
//                                          SubSubCategoriesDetailsPage(
//                                              subCategoryName,
//                                              service.serviceName,
//                                              service.serviceId)));
                            },
                            child: Text(
                              'Add',
                              style: TextStyle(color: _purple, fontSize: 16.0),
                            ),
                            borderSide: BorderSide(color: _purple),
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
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
