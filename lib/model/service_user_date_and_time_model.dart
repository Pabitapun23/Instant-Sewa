class ServiceUserDateAndTimeModel {
//  final AuthState _authState = Injector.get<AuthState>();
  DateTime date;
  DateTime time;
  DateTime now = DateTime.now();

  void setDate(String date) {
    DateTime date2 = DateTime.parse(date);
    //print(date2);
//    if (changeDate(now).difference(changeDate(date2)).inHours < 0) {
//      print('Amrita');
//    }
//    else{
//
//    }
  }

  DateTime changeDate(DateTime dateTime) =>
      DateTime(dateTime.year, dateTime.month, dateTime.day);
//   Future<void>submitSignIn() async
//  {
//   await _authState.signIn(email: this.email, password: this.password);
//  }
}
