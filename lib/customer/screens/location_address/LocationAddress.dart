// ignore_for_file: file_names, no_leading_underscores_for_local_identifiers

part of 'LocationAddressImports.dart';

class LocationAddress extends StatefulWidget {
  final double lat;
  final double lng;

  const LocationAddress({super.key,  required this.lat, required this.lng}) ;
  @override
  State<StatefulWidget> createState()=>_LocationAddress();
}

class _LocationAddress extends State<LocationAddress> with LocationAddressData {


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    getLocationAddress(LatLng(widget.lat, widget.lng),context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffold,
      appBar: AppBar(
          title: BlocBuilder<LocationCubit,LocationState>(
            builder: (context,state){
              return MyText(
                title: state.model.address,
                size: 10,
                color: MyColors.white,
              );
            },
          ),
          backgroundColor: MyColors.primary,
          automaticallyImplyLeading: false,
          centerTitle: true,
          flexibleSpace:const Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
          ),
        ),
      body: _buildGoogleMapView(),
      floatingActionButton: _buildSaveButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _buildGoogleMapView(){
    return BlocBuilder<LocationCubit,LocationState>(
      builder: (context,state){
        CameraPosition _initialLoc = CameraPosition(
          target: LatLng(double.parse(state.model.lat), double.parse(state.model.lng)),
          zoom: 16.4746,
        );
        return GoogleMap(
          mapType: MapType.normal,
          markers: _markers,
          initialCameraPosition: _initialLoc,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
          myLocationButtonEnabled: true,
          myLocationEnabled: true,
          rotateGesturesEnabled: true,
          scrollGesturesEnabled: true,
          trafficEnabled: true,
          zoomControlsEnabled: true,
          tiltGesturesEnabled: true,
          compassEnabled: true,
          indoorViewEnabled: true,
          buildingsEnabled: true,
          mapToolbarEnabled: true,
          zoomGesturesEnabled: true,
          onTap: (location) {
            getLocationAddress(location,context);
          },
          onCameraMove: (loc) {},
        );
      },
    );
  }

  Widget _buildSaveButton(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        InkWell(
          onTap: ()=>_changeLocation(context),
          child: Container(
            height: 45,
            width: MediaQuery.of(context).size.width * .7,
            decoration: BoxDecoration(
                color: MyColors.primary,
                borderRadius: BorderRadius.circular(30)),
            alignment: Alignment.center,
            child: MyText(
              title: tr('saveLocation'),
              size: 12,
              color: MyColors.white,
            ),
          ),
        ),
      ],
    );
  }

}
