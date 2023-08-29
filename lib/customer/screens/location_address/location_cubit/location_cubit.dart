import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:heraggoods/customer/models/Dtos/LocationModel.dart';

part 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  LocationCubit() : super(const LocationInitial());

  onLocationUpdated(LocationModel model, {bool? change}) {
    emit(LocationUpdated(model, change ?? false));
  }
}
