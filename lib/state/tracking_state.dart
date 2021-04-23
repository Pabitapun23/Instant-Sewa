import 'package:instantsewa/application/classes/tracker/operation.dart';
import 'package:instantsewa/application/classes/user/ongoing_tracker.dart';
import 'package:instantsewa/repositories/tracking_repository.dart';

class TrackingState
{
  final TrackingRepository _trackingRepository;
  TrackingState(this._trackingRepository): assert( _trackingRepository!= null);

  List<OperationTracker> _ongoing = [];
  List<OperationTracker> get ongoingProject => _ongoing;
  List<OperationTracker> _completed = [];
  List<OperationTracker> get completedProject => _completed;
  List<OperationTracker> _cancelled = [];
  List<OperationTracker> get cancelledProject => _cancelled;
  List<Operation> _operation = [];
  List<Operation> get operation => _operation;
  Future getOngoingProject() async
  {
    _ongoing= await _trackingRepository.getOngoingProject();
  }
  Future getCompletedProject() async
  {
    _completed= await _trackingRepository.getCompletedProject();
  }
  Future getOperation({String operationId}) async
  {
    _operation = await _trackingRepository.getOperation(operationId: operationId);
  }
  Future getCancelledProject() async
  {
    _cancelled= await _trackingRepository.getCancelledProject();
  }
}