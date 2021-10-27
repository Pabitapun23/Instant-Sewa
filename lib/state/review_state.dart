import 'package:flutter/cupertino.dart';
import 'package:instantsewa/repositories/review_repository.dart';

class ReviewState {
  final ReviewRepository _reviewRepository;

  ReviewState(this._reviewRepository) : assert(_reviewRepository != null);

  Future reviewPost({
    @required String serviceProviderId,
    @required String review,
  }) async {
    await _reviewRepository.ratingPost(
        review: review, serviceProviderId: serviceProviderId);
  }
}
