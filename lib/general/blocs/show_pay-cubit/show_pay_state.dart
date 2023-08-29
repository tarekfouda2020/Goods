part of 'show_pay_cubit.dart';

abstract class ShowPayState extends Equatable {
  final bool show;
  const ShowPayState(this.show);
}

class ShowPayInitial extends ShowPayState {
  const ShowPayInitial() : super(true);

  @override
  List<Object> get props => [show];
}

class ShowPayUpdate extends ShowPayState {
  const ShowPayUpdate(bool show) : super(show);

  @override
  List<Object> get props => [show];
}
