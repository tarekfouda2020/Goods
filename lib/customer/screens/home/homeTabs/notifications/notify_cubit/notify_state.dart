part of 'notify_cubit.dart';

abstract class NotifyState extends Equatable {
  final List<NotifyModel> notifies;
  final bool changed;
  const NotifyState(this.notifies,this.changed);
}

class NotifyInitial extends NotifyState {
  NotifyInitial() : super([], false);

  @override
  List<Object> get props => [notifies,changed];
}

class NotifyUpdated extends NotifyState {
  const NotifyUpdated(List<NotifyModel> notifies, bool changed) : super(notifies, changed);

  @override
  List<Object> get props => [notifies,changed];
}
