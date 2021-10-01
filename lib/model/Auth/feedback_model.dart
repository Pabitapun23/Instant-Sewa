import 'package:instantsewa/state/service_user_update_state.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class FeedbackModel {
  final ServiceUserUpdateState _serviceUserUpdateState = Injector.get<ServiceUserUpdateState>();
  String feedback;
  FeedbackModel({this.feedback});
  void setFeedback(String feedback) {
    this.feedback = feedback;
  }

  bool validateData()
  {
    return this.feedback!= null
    ;
  }

  void feedbackSend() async
  {
    await _serviceUserUpdateState.feedbackToSystem(feedback: this.feedback);
  }

}