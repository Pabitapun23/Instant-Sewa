import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:instantsewa/application/InstantSewa_api.dart';
import 'package:instantsewa/application/classes/errors/common_error.dart';
import 'package:instantsewa/application/storage/localstorage.dart';
import 'package:instantsewa/application/storage/storage_keys.dart';
import 'package:instantsewa/model/Auth/employee_verify_model.dart';
import 'package:instantsewa/router/route_constants.dart';
import 'package:instantsewa/ui/employee_card.dart';
import 'package:instantsewa/util/hexcode.dart';
import 'package:instantsewa/widgets/show_snackbar.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class EmployeeVerification extends StatefulWidget {
  @override
  _EmployeeVerificationState createState() => _EmployeeVerificationState();
}
class _EmployeeVerificationState extends State<EmployeeVerification>  with AutomaticKeepAliveClientMixin {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  String dropdownValue = null;
  List<String> categoryOption=[];
  @override
  void initState() {
    categoryName();
    super.initState();
  }
  void categoryName() async {
    try {
      final response = await InstantSewaAPI.dio.get("/categoryName",
          options: Options(headers: {
            'Authorization': "Bearer ${LocalStorage.getItem(TOKEN)}"
          }));
      List _temp = response.data;
      categoryOption= _temp.cast<String>();
    } on DioError catch (e) {
      throw showNetworkError(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    Color _purple = HexColor('#603f8b');
    return Scaffold(
      appBar: AppBar(
        title: Text('Employee Verification'),
        backgroundColor: _purple,
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, homeRoute);
          },
          icon: Icon(Icons.arrow_back),
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                categoryName();
              });

            },
            icon: Icon(Icons.refresh),
          ),
        ],
      ),
      body: Injector(
          inject: [Inject<EmployeeVerifyModel>(()=>EmployeeVerifyModel())],
          builder: (context)
          {
            final _employeeVerifyModel = RM.get<EmployeeVerifyModel>();
            return Padding(
              padding: const EdgeInsets.only(left: 18.0, right: 18.0, top: 10.0),
              child: Form(
                child: Column(
                  children: [
                    StateBuilder<EmployeeVerifyModel>(
                      builder: (context,_employeeVerifyModel){
                        return TextFormField(
                         onChanged: (String id) {
                          _employeeVerifyModel.setState(
                                  (state) => state.setId(id),
                              catchError: true);
                        },
                          decoration: InputDecoration(
                              errorText:
                              _employeeVerifyModel.hasError
                                  ? _employeeVerifyModel
                                  .error.message
                                  : null,
                              prefixIcon: Icon(Icons.perm_identity),
                              labelText: 'Employee Id',
                              labelStyle: TextStyle(
                                  color: _purple,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 17.0),
                              hintText: 'id number'),
                        );
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
          StateBuilder<EmployeeVerifyModel>(
          builder: (context,_employeeVerifyModel){
          return TextFormField(
            onChanged: (String email) {
              _employeeVerifyModel.setState(
                      (state) => state.setEmail(email),
                  catchError: true);
            },
            decoration: InputDecoration(
                errorText:
                _employeeVerifyModel.hasError
                    ? _employeeVerifyModel
                    .error.message
                    : null,
                prefixIcon: Icon(Icons.email),
                labelText: 'Employee email',
                labelStyle: TextStyle(
                    color: _purple,
                    fontWeight: FontWeight.w500,
                    fontSize: 17.0),
                hintText: 'email address'),
          );}),

                    SizedBox(
                      height: 20,
                    ),

          StateBuilder<EmployeeVerifyModel>(
          builder: (context,_employeeVerifyModel){
          return Align(
            alignment: Alignment.centerLeft,
            child: Container(
              child: Column(
                children: [
                  Text(
                    'Choose Categories',
                    style: TextStyle(
                        color: _purple,
                        fontWeight: FontWeight.w500,
                        fontSize: 17.0),
                  ),

                  DropdownButton<String>(
                    value: dropdownValue,
                    icon: Icon(Icons.arrow_downward),
                    iconSize: 24,
                    elevation: 16,
                    style: TextStyle(color: Colors.deepPurple),
                    underline: Container(
                      height: 2,
                      color: Colors.deepPurpleAccent,
                    ),
                    onChanged: (String newValue) {
                      setState(() {
                        _employeeVerifyModel.setState((state) => state.setCategory(newValue));
                        dropdownValue = newValue;
                      });
                    },
                    items: categoryOption
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          );}),

                    SizedBox(
                      height: 30,
                    ),
          StateBuilder(
          observe: ()=> _employeeVerifyModel,
          builder: (_,model){
          return  Center(
            child: RaisedButton(
              onPressed: () { if (!_employeeVerifyModel.state
                  .validateData()) {
                showSnackBar(
                    key: _key,
                    color: Colors.red,
                    message:
                    "Data is invalid,please fill before submitting the form");
              } else {
                _employeeVerifyModel.setState(
                        (fullNameState) async {
                      await fullNameState.checkEmployee();
                    },
                   );
              }


              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
              color: _purple,
              padding: EdgeInsets.fromLTRB(35, 12, 35, 12),
              child: Text(
                'Search',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17.0,
                ),
              ),
            ),
          );}),

                  ],
                ),
              ),
            );
          }
      ),
    );
  }
  @override
  bool get wantKeepAlive => true;
}
