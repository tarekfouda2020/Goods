part of 'tabs_cubit.dart';

abstract class TabsState extends Equatable {
  final List<TabModel> tabs;
  const TabsState(this.tabs);
}

class TabsInitial extends TabsState {
  TabsInitial() : super([]);
  @override
  List<Object> get props => [tabs];
}

class TabsUpdatedState extends TabsState {
  const TabsUpdatedState(List<TabModel> tabs) : super(tabs);
  @override
  List<Object> get props => [tabs];
}
