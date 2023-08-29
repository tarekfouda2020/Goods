// ignore_for_file: use_build_context_synchronously, file_names

part of 'LocationAddressImports.dart';

class LocationAddressData {
  final GlobalKey<ScaffoldState> _scaffold = GlobalKey<ScaffoldState>();
  final Completer<GoogleMapController> _controller = Completer();
  final Set<Marker> _markers = {};
  late LocationModel locationModel;
  final String apiKey = "AIzaSyDIBH6mfPQ13UnF9aZtmaUQtuu-mQcxxb0";

  void getLocationAddress(LatLng position, BuildContext context) async {
    _setAddMarker("current", position);
    LatLng loc = position;
    String? address = await _getAddress(loc, context);
    locationModel = LocationModel(
        loc.latitude.toString(), loc.longitude.toString(), address!);
    context.read<LocationCubit>().onLocationUpdated(locationModel);
  }

  Future<String?> _getAddress(LatLng latLng, BuildContext context) async {
    final coordinates = Coordinates(latLng.latitude, latLng.longitude);
    List<Address> addresses =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    var first = addresses.first;
    debugPrint("${first.featureName} : ${first.addressLine}");
    return first.addressLine;
  }

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(
      data.buffer.asUint8List(),
    );
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  void _setAddMarker(id, position) async {
    _markers.clear();
    //Uint8List markerIcon = await getBytesFromAsset('images/maps.png', 10);
    _markers.add(Marker(
      // This marker id can be anything that uniquely identifies each marker.
      markerId: MarkerId(id),
      position: position,
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
    ));
    // setState(() {});
  }

  void _changeLocation(BuildContext context) async {
    context
        .read<LocationCubit>()
        .onLocationUpdated(locationModel, change: true);
    AutoRouter.of(context).pop();
  }
}
