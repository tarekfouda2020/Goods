// ignore_for_file: file_names, library_private_types_in_public_api

part of 'EditOfferLocImports.dart';

class EditOfferLocation extends StatefulWidget {
  final UpdateAdModel model;
  final AdsDataModel adModel;

  const EditOfferLocation(
      {super.key, required this.model, required this.adModel});

  @override
  _AddOfferLocationState createState() => _AddOfferLocationState();
}

class _AddOfferLocationState extends State<EditOfferLocation>
    with EditOfferLocData {
  String? neighborsString, citiesString, regionString;
  DropDownModel? model;

  @override
  void initState() {
    regionString = widget.adModel.location!.split(',').first;
    citiesString = widget.adModel.location!.split(',')[1].replaceFirst(' ', '');
    neighborsString =
        widget.adModel.location!.split(',').last.replaceFirst(' ', '');

    getSelectedRegion();

    LocationModel locationModel =
        LocationModel(widget.model.lat ?? "", widget.model.lng ?? "", "");
    context.read<LocationCubit>().onLocationUpdated(locationModel);
    super.initState();
  }

  getSelectedRegion() async {
    List<DropDownModel> list = [];
    await CustomerRepository(context).getRegionData().then((value) {
      list.addAll(value);
    });
    model = list.firstWhere((element) =>
        regionString!.contains(element.name) ||
        element.name.contains(regionString!));
    regionCubit.onUpdateData(model);
    setSelectRegion(regionCubit.state.data!);
    await getSelectedCity();
  }

  getSelectedCity() async {
    List<DropDownModel> list = [];
    await CustomerRepository(context)
        .getCitiesData(regionCubit.state.data!.id.toString())
        .then((value) {
      list.addAll(value);
    });
    model = list.firstWhere((element) =>
        citiesString!.contains(element.name) ||
        element.name.contains(citiesString!));
    cityCubit.onUpdateData(model);
    setSelectCity(cityCubit.state.data!);
    await getSelectedNeighbor();
  }

  getSelectedNeighbor() async {
    List<DropDownModel> list = [];
    await CustomerRepository(context)
        .getNeighborsData(cityCubit.state.data!.id.toString())
        .then((value) {
      list.addAll(value);
    });
    model =
        list.firstWhere((element) => neighborsString!.contains(element.name));
    neighborCubit.onUpdateData(model);
    setSelectNeighbor(neighborCubit.state.data!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffold,
      appBar: DefaultAppBar(title: "تفاصيل الإعلان", con: context),
      body: ListView(
        children: [
          _buildDropDownInputs(),
          BlocConsumer<LocationCubit, LocationState>(
            listener: (context, state) {
              address.text = state.model.address;
            },
            builder: (context, state) {
              return InkWellTextField(
                controller: address,
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                icon: Icon(
                  Icons.location_pin,
                  size: 20,
                  color: MyColors.black,
                ),
                label: "الموقع",
                onTab: () => navigateToLocationAddress(context),
              );
            },
          )
        ],
      ),
      bottomNavigationBar: _buildNavButton(context),
    );
  }

  Widget _buildDropDownInputs() {
    return Form(
      key: formKey,
      child: Column(
        children: [
          BlocBuilder<GenericCubit<DropDownModel?>,
              GenericState<DropDownModel?>>(
            bloc: regionCubit,
            builder: (context, state) {
              return DropdownTextField<DropDownModel>(
                label: "اسم المنطقة",
                selectedItem: state.data,
                dropKey: region,
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                onChange: setSelectRegion,
                finData: (filter) async =>
                    await CustomerRepository(context).getRegionData(),
                validate: (value) =>
                    Validator().validateDropDown<DropDownModel>(model: value),
              );
            },
          ),
          BlocBuilder<GenericCubit<DropDownModel?>,
              GenericState<DropDownModel?>>(
            bloc: cityCubit,
            builder: (context, state) {
              return DropdownTextField<DropDownModel>(
                label: "اسم المدينة",
                selectedItem: state.data,
                dropKey: city,
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                onChange: (v) => v != null ? setSelectCity(v) : null,
                validate: (value) =>
                    Validator().validateDropDown<DropDownModel>(model: value),
                finData: (filter) async =>
                    await CustomerRepository(context).getCitiesData(regionId),
              );
            },
          ),
          BlocBuilder<GenericCubit<DropDownModel?>,
              GenericState<DropDownModel?>>(
            bloc: neighborCubit,
            builder: (context, state) {
              return DropdownTextField<DropDownModel>(
                label: "اسم الحي",
                selectedItem: state.data,
                dropKey: neighbor,
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                onChange: (v) => v != null ? setSelectNeighbor(v) : null,
                validate: (value) =>
                    Validator().validateDropDown<DropDownModel>(model: value),
                finData: (filter) async =>
                    await CustomerRepository(context).getNeighborsData(cityId),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildNavButton(BuildContext context) {
    return InkWell(
      onTap: () => navigateToAddDetails(widget.model, widget.adModel, context),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: MyColors.primary,
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(20), topLeft: Radius.circular(20)),
        ),
        alignment: Alignment.center,
        child: MyText(
          title: "استمرار",
          size: 12,
          color: MyColors.white,
        ),
      ),
    );
  }
}
