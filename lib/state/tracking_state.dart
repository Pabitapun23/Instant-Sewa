import 'package:instantsewa/application/classes/user/ongoing_tracker.dart';
import 'package:instantsewa/repositories/tracking_repository.dart';

class TrackingState
{
  final TrackingRepository _trackingRepository;
  TrackingState(this._trackingRepository): assert( _trackingRepository!= null);

  List<OperationTracker> _ongoing = [];
  List<OperationTracker> get ongoingProject => _ongoing;
  List<OperationTracker> _completed = [];
  List<OperationTracker> get compleltedProject => _completed;
  Future getOngoingProject() async
  {
    _ongoing= await _trackingRepository.getOngoingProject();
  }
  Future getCompletedProject() async
  {
    _completed= await _trackingRepository.getCompletedProject();
  }
}