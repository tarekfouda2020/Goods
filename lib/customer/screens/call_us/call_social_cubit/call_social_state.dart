part of 'call_social_cubit.dart';

abstract class CallSocialState extends Equatable {
  final ContactModel? model;
  final bool change;
  const CallSocialState(this.model, this.change);
}

class CallSocialInitial extends CallSocialState {
  const CallSocialInitial() : super(null, false);


  @override
  List<Object> get props => [model!];
}


class CallSocialUpdate extends CallSocialState {
  const CallSocialUpdate(ContactModel model, bool change) : super(model, change);


  @override
  List<Object> get props => [model!];
}
