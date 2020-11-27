import 'package:instantsewa/state/rating_state.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class RateModel
{
  final RatingState _ratingState = Injector.get<RatingState>();
  int rate ;
  String serviceProviderId;
  String review;
  void setRate(int rate)
  {
    this.rate = rate;
  }
  bool validateData() {
    return this.rate != null;
  }
  Future<void> sendData({int rate,String serviceProviderId}) async {

      _ratingState.ratingPost(serviceProviderId:serviceProviderId, rate: rate );
  }

}