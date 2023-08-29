part of 'home_tab_cubit.dart';

abstract class HomeTabState extends Equatable {
  final int current;
  const HomeTabState(this.current);
}

class HomeTabInitial extends HomeTabState {
  const HomeTabInitial(int current) : super(current);

  @override
  List<Object> get props => [current];
}

class HomeTabUpdate extends HomeTabState {
  const HomeTabUpdate(int current) : super(current);

  @override
  List<Object> get props => [current];
}
