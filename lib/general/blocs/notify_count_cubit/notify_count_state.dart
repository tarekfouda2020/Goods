part of 'notify_count_cubit.dart';

abstract class NotifyCountState extends Equatable {
  final int count;
  const NotifyCountState(this.count);
}

class NotifyCountInitial extends NotifyCountState {
  const NotifyCountInitial() : super(0);

  @override
  List<Object> get props => [count];
}

class NotifyCountUpdate extends NotifyCountState {
  const NotifyCountUpdate(int count) : super(count);

  @override
  List<Object> get props => [count];
}
