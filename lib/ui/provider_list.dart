import 'package:flutter/material.dart';
import 'package:instantsewa/state/service_provider_state.dart';
import 'package:instantsewa/ui/service_provider_details_page.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

// ignore: must_be_immutable
class ProviderList extends StatefulWidget {
  @override
  _ProviderListState createState() => _ProviderListState();
}

class _ProviderListState extends State<ProviderList> with AutomaticKeepAliveClientMixin {
  final _serviceProviderStateRM = RM.get<ServiceProviderState>();
  @override
  void initState() {
    _serviceProviderStateRM.setState((profileState) => profileState.getServiceProviderInformation());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      height: 200,
      alignment: Alignment.centerLeft,
      child: StateBuilder<ServiceProviderState>(
        observe: () => _serviceProviderStateRM,
        builder: (context, model) {
          return ListView(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          scrollDirection: Axis.horizontal,
    children: [
      ...model.state.providers.map((user) => Column(
        children: [
              GestureDetector(
              onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) =>
                        ServiceProviderDetailsPage(
                          index: user.id,
                        )));
          },
          child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
          Container(
          width: 130,
          height: 100,
          alignment: Alignment.center,
          margin: EdgeInsets.all(3.0),
          decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          image: DecorationImage(
          image: ExactAssetImage('images/photos/provider.png'),
          fit: BoxFit.contain,
          ),
          boxShadow: [
          BoxShadow(
          color: Colors.black12,
          offset: Offset(0, 5),
          blurRadius: 10,
          )
          ],
          ),
          ),
          SizedBox(
          height: 10.0,
          ),
          Container(
          width: 130,
          alignment: Alignment.center,
          child: Text(
          user.userName,
          style: TextStyle(fontSize: 14, color: Colors.black),
          ),
          ),
          Container(
          width: 130,
          alignment: Alignment.center,
          margin: EdgeInsets.only(left: 4.0, top: 4.0),
          child: Text(
          user.job,
          style: TextStyle(
          fontSize: 14,
          color: Colors.black,
          fontWeight: FontWeight.bold),
          ),
          ),
          ],
          ),
          ),
        ],

    ))
    ],
    );
    }
    )
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
