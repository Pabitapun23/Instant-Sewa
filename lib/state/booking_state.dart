import 'package:flutter/cupertino.dart';
import 'package:instantsewa/repositories/booking_repository.dart';

class BookingState {
  final BookingRepository _bookingRepository;

  BookingState(this._bookingRepository) : assert(_bookingRepository != null);

  Future bookServiceProvider({
    @required String serviceId,
    @required String latitude,
    @required String longitude,
    @required String address,
    @required String serviceProviderId,
    @required DateTime startTime,
    @required DateTime endTime,
  }) async {
    await _bookingRepository.bookServiceProvider(
        serviceId: serviceId,
        latitude: latitude,
        longitude: longitude,
        address: address,
        serviceProviderId: serviceProviderId,
        startTime: startTime,
        endTime: endTime);
  }
}
