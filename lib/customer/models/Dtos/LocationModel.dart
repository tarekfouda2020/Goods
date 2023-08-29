// ignore_for_file: file_names

import 'package:equatable/equatable.dart';

class LocationModel extends Equatable{

  final String lat;
  final String lng;
  final String address;

  const LocationModel(this.lat, this.lng, this.address);
  @override
  List<Object> get props => [lat,lng,address];

}