import 'package:instantsewa/state/rating_state.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class ReviewModel {
  final RatingState _reviewState = Injector.get<RatingState>();
  String serviceProviderId;
  String review;
  void setReview(String review) {
    this.review = review;
  }

  bool validateData() {
    return this.review != null;
  }

  Future<void> sendData({String serviceProviderId}) async {
    _reviewState.reviewPost(
        serviceProviderId: serviceProviderId, review: this.review);
  }
}
