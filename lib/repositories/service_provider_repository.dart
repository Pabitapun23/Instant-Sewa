import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:instantsewa/application/InstantSewa_api.dart';
import 'package:instantsewa/application/classes/errors/common_error.dart';
import 'package:instantsewa/application/classes/user/user.dart';
import 'package:instantsewa/application/storage/localstorage.dart';
import 'package:instantsewa/application/storage/storage_keys.dart';
import 'package:instantsewa/providers/cart.dart';
import 'package:instantsewa/router/route_constants.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

abstract class ServiceProviderRepository {
  Future<List<User>> getServiceProviderInformation();
  Future<List<User>> getServiceProviderDetails($id);
  Future setFavouriteServiceProvider({@required String service_provider_id});
  Future<bool> getFavouriteServiceProvider(
      {@required String service_provider_id});
  Future bookServiceProvider({
    @required List<String> cartId,
    @required String latitude,
    @required String longitude,
    @required String address,
    @required String serviceProviderId,
    @required String startTime,
    @required String endTime,
  });
}

class ServiceProviderRepositoryImpl implements ServiceProviderRepository {
  final cart = Provider.of<Cart>(RM.context, listen: true);
  @override
  Future<List<User>> getServiceProviderInformation() async {
    try {
      final response = await InstantSewaAPI.dio.get("/serviceprovider",
          options: Options(headers: {
            'Authorization': "Bearer ${LocalStorage.getItem(TOKEN)}"
          }));
      List _temp = response.data['data'];
      List<User> _serviceProviders = _temp
          .map((serviceprovider) => User.fromJson(serviceprovider))
          .toList();
      return _serviceProviders;
    } on DioError catch (e) {
      throw showNetworkError(e);
    }
  }

  @override
  Future<List<User>> getServiceProviderDetails($id) async {
    String url = "/serviceprovider/" + $id;
    try {
      final response = await InstantSewaAPI.dio.get(url,
          options: Options(headers: {
            'Authorization': "Bearer ${LocalStorage.getItem(TOKEN)}"
          }));
      List _temp = response.data['data'];
      List<User> _serviceProviders = _temp
          .map((serviceprovider) => User.fromJson(serviceprovider))
          .toList();
      return _serviceProviders;
    } on DioError catch (e) {
      throw showNetworkError(e);
    }
  }

  @override
  // ignore: non_constant_identifier_names
  Future setFavouriteServiceProvider({String service_provider_id}) async {
    String id;
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var user = jsonDecode(localStorage.getString('user'));
    id = user['id'].toString();
    bool result = await getFavouriteServiceProvider(
        service_provider_id: service_provider_id);
    if (!result) {
      try {
        Dio dio = new Dio();
        Response response = await InstantSewaAPI.dio.post("/favourite",
            data: {
              "service_user_id": id,
              "service_provider_id": service_provider_id
            },
            options: Options(headers: {
              'Authorization': "Bearer ${LocalStorage.getItem(TOKEN)}"
            }));
        return true;
      } on DioError catch (e) {
        showNetworkError(e);
      }
    } else {
      try {
        Dio dio = new Dio();
        Response response = await InstantSewaAPI.dio.post("/deleteFavourite",
            data: {
              "service_user_id": id,
              "service_provider_id": service_provider_id
            },
            options: Options(headers: {
              'Authorization': "Bearer ${LocalStorage.getItem(TOKEN)}"
            }));
        return true;
      } on DioError catch (e) {
        showNetworkError(e);
      }
    }
  }

  @override
  // ignore: non_constant_identifier_names
  Future<bool> getFavouriteServiceProvider({String service_provider_id}) async {
    String id;
    try {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      var user = jsonDecode(localStorage.getString('user'));
      id = user['id'].toString();
      Dio dio = new Dio();
      Response response = await InstantSewaAPI.dio.post("/checker",
          data: {
            "service_user_id": id,
            "service_provider_id": service_provider_id
          },
          options: Options(headers: {
            'Authorization': "Bearer ${LocalStorage.getItem(TOKEN)}"
          }));
      if (response.data['data'] == 'true') {
        return true;
      } else {
        return false;
      }
    } on DioError catch (e) {
      showNetworkError(e);
    }
  }

  @override
  Future bookServiceProvider({
    List<String> cartId,
    String latitude,
    String longitude,
    String address,
    String serviceProviderId,
    String startTime,
    String endTime,
  }) async {
    try {
      String id;
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      var user = jsonDecode(localStorage.getString('user'));
      id = user['id'].toString();
      Dio dio = new Dio();
      Response response = await InstantSewaAPI.dio.post("/cartgroup" ,
          data: {
            "service_user": "${LocalStorage.getItem(USERNAME)}",
          },
          options: Options(headers: {
            'Authorization': "Bearer ${LocalStorage.getItem(TOKEN)}"
          }));
      String cartCollectionId = response.data;
       while (cartId.isNotEmpty) {
         String serviceName = cart.getServiceName(cartId[0]);
         String quantity = cart.quantityCount(serviceName);
         int i = cart.numberById(serviceName);
      Response response2 = await InstantSewaAPI.dio.post("/cart" ,
          data: {
            "service_name": serviceName,
            "quantity" : quantity,
            "cart_collection_id":cartCollectionId,
          },
          options: Options(headers: {
            'Authorization': "Bearer ${LocalStorage.getItem(TOKEN)}"
          }));
       cart.removeItem(cart.services.keys.toList()[i]);
       cartId.remove(cartId[0]);
      }
      Response response2 = await InstantSewaAPI.dio.post("/book" ,
          data: {
            "cart_collection_id": cartCollectionId,
            "address_latitude" : latitude,
            "address_longitude":longitude,
            "address_address":address,
            "service_provider_id":serviceProviderId,
            "service_user_id":id,
            "start_time":startTime,
            "end_time":endTime,
          },
          options: Options(headers: {
            'Authorization': "Bearer ${LocalStorage.getItem(TOKEN)}"
          }));
      Navigator.pushNamed(RM.context, trackerRoute);
    } on DioError catch (e) {
      showNetworkError(e);
    }
  }
}
