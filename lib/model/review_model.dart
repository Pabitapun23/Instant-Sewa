import 'package:instantsewa/state/review_state.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class ReviewModel {
  final ReviewState _reviewState = Injector.get<ReviewState>();
  String serviceProviderId;
  String review;
  void setReview(String review) {
    this.review = review;
  }

  bool validateData() {
    return this.review != null;
  }

  Future<void> sendData({String review, String serviceProviderId}) async {
    _reviewState.reviewPost(
        serviceProviderId: serviceProviderId, review: review);
  }
}
