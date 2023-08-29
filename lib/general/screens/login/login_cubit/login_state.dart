part of 'login_cubit.dart';

abstract class LoginState extends Equatable {
  final bool loading;
  const LoginState(this.loading);
}

class LoginInitial extends LoginState {
  const LoginInitial() : super(false);

  @override
  List<Object> get props => [loading];
}

class LoginChangeState extends LoginState {
  const LoginChangeState(bool loading) : super(loading);

  @override
  List<Object> get props => [loading];
}
