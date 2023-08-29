part of 'swearing_cubit.dart';

abstract class SwearingState extends Equatable {
  final bool accepted ;
  const SwearingState(this.accepted);
}

class SwearingInitial extends SwearingState {
  const SwearingInitial() : super(false);

  @override
  List<Object> get props => [accepted];
}

class SwearingChangedState extends SwearingState {
  const SwearingChangedState(bool accepted) : super(accepted);
  @override
  List<Object> get props => [accepted];
}
