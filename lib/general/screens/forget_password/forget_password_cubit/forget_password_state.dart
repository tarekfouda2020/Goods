part of 'forget_password_cubit.dart';

abstract class ForgetPasswordState extends Equatable {
  final bool showLoading;
  const ForgetPasswordState(this.showLoading);
}

class ForgetPasswordInitial extends ForgetPasswordState {
  const ForgetPasswordInitial() : super(false);

  @override
  List<Object> get props => [showLoading];
}

class ForgetPasswordUpdate extends ForgetPasswordState {
  const ForgetPasswordUpdate(bool showLoading) : super(showLoading);

  @override
  List<Object> get props => [showLoading];
}
