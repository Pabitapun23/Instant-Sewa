import 'package:flutter/cupertino.dart';
import 'package:instantsewa/repositories/rating_repository.dart';

class RatingState {
  final RatingRepository _ratingRepository;

  RatingState(this._ratingRepository) : assert(_ratingRepository != null);

  Future ratingPost({
    @required String serviceProviderId ,
    @required int rate,
  }) async {
    await _ratingRepository.ratingPost(rate: rate, serviceProviderId: serviceProviderId);
  }
}
