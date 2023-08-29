// ignore_for_file: file_names

import 'package:google_maps_flutter/google_maps_flutter.dart';

class MarkersModel{
  Set<Marker> markers;
  double lat;
  double lng;

  MarkersModel({required this.markers,required this.lat,required this.lng});
}