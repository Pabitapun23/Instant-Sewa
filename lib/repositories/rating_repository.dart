import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:instantsewa/application/InstantSewa_api.dart';
import 'package:instantsewa/application/classes/errors/common_error.dart';
import 'package:instantsewa/application/storage/localstorage.dart';
import 'package:instantsewa/application/storage/storage_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class RatingRepository{
  Future ratingPost({
  @required int rate,
    @required String serviceProviderId,
});
}
class RatingRepositoryImpl implements RatingRepository
{
  @override
  Future ratingPost({int rate, String serviceProviderId})
  async {
    try {
      Response response = await InstantSewaAPI.dio
          .post("/rateandreview", data: {
        "rating": rate,
        "service_provider_id": serviceProviderId,
      }, options: Options(headers: {
        'Authorization': "Bearer ${LocalStorage.getItem(TOKEN)}"
      }));
    } on DioError catch (e) {
      throw showNetworkError(e);
    }
  }
}