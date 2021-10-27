import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instantsewa/model/rate_model.dart';
import 'package:instantsewa/model/review_model.dart';
import 'package:instantsewa/state/rating_state.dart';
import 'package:instantsewa/state/review_state.dart';
import 'package:instantsewa/state/service_provider_state.dart';
import 'package:instantsewa/ui/payment_page.dart';
import 'package:instantsewa/util/hexcode.dart';
import 'package:rating_dialog/rating_dialog.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class ProviderDetailsPage extends StatefulWidget {
  final String index, status;
  const ProviderDetailsPage({this.index, this.status});
  @override
  _ProviderDetailsPageState createState() => _ProviderDetailsPageState();
}

class _ProviderDetailsPageState extends State<ProviderDetailsPage>
    with AutomaticKeepAliveClientMixin {
  Color _purple = HexColor('#603f8b');
  final _formKey = GlobalKey<FormState>();
  final _serviceProviderStateRM = RM.get<ServiceProviderState>();
  final _rateModel = RM.get<RatingState>();
  final _reviewModel = RM.get<ReviewState>();
  bool _like = false;
  bool _isLoading = false;
  @override
  void initState() {
    _isLoading = false;
    _serviceProviderStateRM.setState((profileState) async {
      profileState.getServiceProviderDetails(widget.index);
      _like = await profileState.getFavouriteServiceProvider(
          service_provider_id: widget.index);
    });
    _isLoading = true;
    super.initState();
  }

  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
   String review;
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider Details'),
        backgroundColor: _purple,
        actions: [
          IconButton(
            icon: Icon(
              Icons.rate_review_rounded,
              color: Colors.white,
            ),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content: Stack(
                        overflow: Overflow.visible,
                        children: <Widget>[
                          Positioned(
                            right: -40.0,
                            top: -40.0,
                            child: InkResponse(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: CircleAvatar(
                                child: Icon(Icons.close),
                                backgroundColor: _purple,
                                foregroundColor: Colors.white,
                              ),
                            ),
                          ),
                          Form(
                            key: _formKey,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    minLines: 4,
                                    maxLines: 10,
                                    keyboardType: TextInputType.multiline,
                                    onChanged: (String feedback) {
                                      review = feedback;
                                    },
                                    decoration: InputDecoration(
                                      hintText: 'Write your review',
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: RaisedButton(
                                    child: Text(
                                      "Send",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25.0),
                                    ),
                                    color: _purple,
                                    onPressed: () {
                                      if(review !=null )
                                        {
                                          _reviewModel.setState((s) {
                                            s.reviewPost(serviceProviderId: widget.index, review: review);
                                          });
                                        }
                                    },
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  });
            },
          )
        ],
      ),
      body: StateBuilder<ServiceProviderState>(
          observe: () => _serviceProviderStateRM,
          builder: (context, model) {
            return SingleChildScrollView(
                child: Column(
              children: <Widget>[
                ...model.state.provider.map((provider) {
                  return Column(
                    children: <Widget>[
                      (!_isLoading)
                          ? new Center(
                              child: new SizedBox(
                                height: 50.0,
                                width: 50.0,
                                child: new CircularProgressIndicator(
                                  value: null,
                                  strokeWidth: 7.0,
                                ),
                              ),
                            )
                          : Container(
                              width: width,
                              child: Stack(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(30.0),
                                    child: Container(
                                      height: height * 0.45,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: ExactAssetImage(
                                              'images/photos/provider.png'),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: width,
                                    margin: EdgeInsets.only(top: height * 0.45),
                                    padding: EdgeInsets.all(30.0),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(30),
                                        topRight: Radius.circular(30),
                                      ),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Icon(
                                              Icons.location_on,
                                              size: 30,
                                              color: Colors.black26,
                                            ),
                                            Text(
                                              provider.address,
                                              style: TextStyle(
                                                  fontSize: 20.0,
                                                  color: Colors.black26),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          provider.fullName,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 25,
                                              color: Colors.black),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Container(
                                          height: 50,
                                          width: width,
                                          child: ListView.builder(
                                              scrollDirection: Axis.horizontal,
                                              itemCount: 3,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                return Icon(
                                                  Icons.star,
                                                  color: Colors.yellow[500],
                                                  size: 30,
                                                );
                                              }),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          'Details',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          provider.job,
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black54,
                                              letterSpacing: 0.5,
                                              wordSpacing: 1.5),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        widget.status == 'Completed'
                                            ? Center(
                                                child: RaisedButton(
                                                  onPressed: () {
                                                    showDialog(
                                                        context: context,
                                                        builder: (context) {
                                                          return RatingDialog(
                                                            icon: Image.asset(
                                                              'images/photos/provider.png',
                                                              width: 50,
                                                            ),
                                                            title: provider
                                                                .userName,
                                                            description:
                                                                'Rate the Provider',
                                                            onSubmitPressed:
                                                                (int rating) {
                                                              _rateModel.setState((state) =>
                                                                  state.ratingPost(
                                                                      rate:
                                                                          rating,
                                                                      serviceProviderId:
                                                                          provider
                                                                              .id));
                                                            },
                                                            accentColor:
                                                                _purple,
                                                            submitButton:
                                                                'Submit',
                                                          );
                                                        });
                                                  },
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            25.0),
                                                  ),
                                                  color: _purple,
                                                  padding: EdgeInsets.fromLTRB(
                                                      35, 12, 35, 12),
                                                  child: Text(
                                                    'Rate Now',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 17.0,
                                                    ),
                                                  ),
                                                ),
                                              )
                                            : Center(),
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    right: 25,
                                    top: height * 0.40,
                                    child: GestureDetector(
                                      onTap: () {
                                        _serviceProviderStateRM
                                            .setState((favouritestate) async {
                                          await favouritestate
                                              .setFavouriteServiceProvider(
                                                  $service_provider_id:
                                                      provider.id);
                                          _like = await favouritestate
                                              .getFavouriteServiceProvider(
                                                  service_provider_id:
                                                      provider.id);
                                        });
                                      },
                                      child: Container(
                                        height: 50,
                                        width: 50,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(35.0),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.black.withOpacity(0.5),
                                              blurRadius: 5,
                                              spreadRadius: 1,
                                            )
                                          ],
                                        ),
                                        child: Icon(
                                          Icons.favorite,
                                          size: 35,
                                          color: (_like)
                                              ? Colors.red[800]
                                              : Colors.grey[600],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                    ],
                  );
                })
              ],
            ));
          }),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
