import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instantsewa/state/service_provider_state.dart';
import 'package:instantsewa/util/hexcode.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../base_url.dart';

class EmployeeCard extends StatefulWidget {
  String id;
  EmployeeCard({
    Key key,
    this.id,
  }) : super(key: key);
  @override
  _EmployeeCardState createState() => _EmployeeCardState();
}

class _EmployeeCardState extends State<EmployeeCard>
    with AutomaticKeepAliveClientMixin {
  final _serviceProviderStateRM = RM.get<ServiceProviderState>();
  bool _isLoading = false;
  @override
  void initState() {
    _isLoading = false;
    _serviceProviderStateRM.setState((profileState) async {
      await profileState.getServiceProviderDetails(widget.id);
    });
    _isLoading = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Color _purple = HexColor('#603f8b');
    return Scaffold(
      appBar: AppBar(
        title: Text('Employee Id Card'),
        centerTitle: true,
        backgroundColor: _purple,
      ),
      body: StateBuilder<ServiceProviderState>(
          observe: () => _serviceProviderStateRM,
          builder: (context, model) {
            return Center(
              child: SizedBox(
                height: size.height * 0.4,
                child: Card(
                  elevation: 5.0,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ...model.state.provider.map((provider) {
                        return Column(
                          children: [
                            Container(
                              width: size.width,
                              height: size.height * 0.07,
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'Instant Sewa Employee Id Card',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18.0),
                                ),
                              ),
                              padding: EdgeInsets.only(top: 6.0),
                              decoration: BoxDecoration(
                                color: _purple,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 80.0,
                                  child: ClipRRect(
                                    child: SizedBox(
                                      width: 150.0,
                                      height: 150.0,
                                      child: provider.avatar == null
                                          ? Image.asset(
                                              "images/photos/provider.png",
                                              fit: BoxFit.fill,
                                            )
                                          : Image.network(
                                              BASE_URL +
                                                  '/img/' +
                                                  provider.avatar,
                                              fit: BoxFit.fill,
                                            ),
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Id',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Text(
                                      'Name',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Text(
                                      'E-mail',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Text(
                                      'Contact',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 2,
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(provider.id),
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Text(provider.fullName),
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Text(provider.email),
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Text(provider.phoneNumber),
                                  ],
                                )
                              ],
                            ),
                            Container(
                              width: size.width,
                              height: size.height * 0.068,
                              decoration: BoxDecoration(
                                color: _purple,
                              ),
                            ),
                          ],
                        );
                      }),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
