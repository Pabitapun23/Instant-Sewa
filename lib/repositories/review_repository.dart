import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:instantsewa/application/InstantSewa_api.dart';
import 'package:instantsewa/application/classes/errors/common_error.dart';
import 'package:instantsewa/application/storage/localstorage.dart';
import 'package:instantsewa/application/storage/storage_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ReviewRepository {
  Future ratingPost({
    @required String review,
    @required String serviceProviderId,
  });
}

class ReviewRepositoryImpl implements ReviewRepository {
  @override
  Future ratingPost({String review, String serviceProviderId}) async {
    try {
      Response response = await InstantSewaAPI.dio.post("/review",
          data: {
            "review": review,
            "service_provider_id": serviceProviderId,
          },
          options: Options(headers: {
            'Authorization': "Bearer ${LocalStorage.getItem(TOKEN)}"
          }));
    } on DioError catch (e) {
      throw showNetworkError(e);
    }
  }
}
