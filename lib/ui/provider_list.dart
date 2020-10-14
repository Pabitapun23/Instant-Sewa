import 'package:flutter/material.dart';
import 'package:instantsewa/model/provider_model.dart';
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
      ...model.state.
    ],
    );
    }
        },
      )
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
