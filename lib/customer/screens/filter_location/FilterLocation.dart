// ignore_for_file: file_names

part of 'FilterLocationImports.dart';

class FilterLocation extends StatefulWidget {
  final double lat,lng;

  const FilterLocation({super.key,  required this.lat, required this.lng});
  @override
  State<StatefulWidget> createState()=>_LocationAddress();
}

class _LocationAddress extends State<FilterLocation> with FilterLocationData {

  @override
  void didChangeDependencies() {
    addressCubit.onUpdateData(LocationModel("${widget.lat}","${widget.lng}",""));
    setCurrentMarker(LatLng(widget.lat,widget.lng));
    getLocationAddress(LatLng(widget.lat, widget.lng),context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: BlocBuilder<GenericCubit<LocationModel?>,GenericState<LocationModel?>>(
          bloc: addressCubit,
          builder: (context,state){
            return MyText(
              title: state.data!.address,
              size: 10,
              color: MyColors.white,
            );
          },
        ),
        backgroundColor: MyColors.primary,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back,size: 25,color: MyColors.white,),
          onPressed: ()=> AutoRouter.of(context).pop(),
        ),
        centerTitle: true,
        flexibleSpace: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
        ),
      ),
      body: _buildGoogleMapView(),
    );
  }

  Widget _buildGoogleMapView(){
    return BlocBuilder<GenericCubit<MarkersModel>,GenericState<MarkersModel>>(
      bloc: markersCubit,
      builder: (context,state){
        CameraPosition initialLoc = CameraPosition(
          target: LatLng(state.data.lat, state.data.lng),
          zoom: 10.4746,
        );
        return Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: GoogleMap(
                mapType: MapType.normal,
                markers: state.data.markers,
                initialCameraPosition: initialLoc,
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
              ),
            ),
            // Positioned(
            //   top: 10,
            //   child: SearchMapPlaceWidget(
            //     apiKey: apiKey,
            //     placeholder: "كلمة البحث",
            //     language: context.locale.languageCode,
            //     location: LatLng(state.data.lat, state.data.lng),
            //     radius: 30000,
            //     onSelected: (place)=>autoCompleteSearch(place,context),
            //   ),
            // )
          ],
        );
      },
    );
  }


}