part of 'location_cubit.dart';

abstract class LocationState extends Equatable {
  final LocationModel model;
  final bool changed;
  const LocationState({required this.model, required this.changed});
}

class LocationInitial extends LocationState {
  const LocationInitial() : super(model: const LocationModel("0", "0", ""),changed: false);

  @override
  List<Object> get props => [model,changed];
}

class LocationUpdated extends LocationState {
  const LocationUpdated(LocationModel model,bool changed) : super(model: model,changed: changed);
  @override
  List<Object> get props => [model,changed];
}
