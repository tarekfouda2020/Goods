part of 'rate_user_cubit.dart';

abstract class RateUserState extends Equatable {
  final double rate;
  const RateUserState({required this.rate});
}

class RateUserInitial extends RateUserState {
  const RateUserInitial() : super(rate: 0);

  @override
  List<Object> get props => [rate];
}

class RateUserUpdated extends RateUserState {
  const RateUserUpdated(
      {required double rate,   double? preRate, bool? showRate})
      : super(rate: rate);

  @override
  List<Object> get props => [rate];
}
