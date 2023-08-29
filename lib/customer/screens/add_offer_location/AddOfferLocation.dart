// ignore_for_file: library_private_types_in_public_api, file_names

part of 'AddOfferLocImports.dart';

class AddOfferLocation extends StatefulWidget {
  final AddAdsModel model;

  const AddOfferLocation({super.key, required this.model});

  @override
  _AddOfferLocationState createState() => _AddOfferLocationState();
}

class _AddOfferLocationState extends State<AddOfferLocation> {
  AddOfferLocData addOfferLocData = AddOfferLocData();

  @override
  void initState() {

    log("modeeeel==>${widget.model.toJson()}");
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    log("modeeeel==>${widget.model.toJson()}");
    return Scaffold(
      key: addOfferLocData.scaffold,
      appBar: DefaultAppBar(title: "تفاصيل الإعلان", con: context),
      body: ListView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        children: [
          _buildDropDownInputs(),
          BlocConsumer<LocationCubit, LocationState>(
            listener: (context, state) {
              addOfferLocData.address.text = state.model.address;
            },
            builder: (context, state) {
              return InkWellTextField(
                controller: addOfferLocData.address,
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                icon: Icon(
                  Icons.location_pin,
                  size: 20,
                  color: MyColors.black,
                ),
                label: "الموقع",
                onTab: () => addOfferLocData.navigateToLocationAddress(context),
              );
            },
          ),
        ],
      ),
      bottomNavigationBar: _buildNavButton(context),
    );
  }

  Widget _buildDropDownInputs() {
    return Form(
      key: addOfferLocData.formKey,
      child: Column(
        children: [
          DropdownTextField<DropDownModel>(
            label: "اسم المنطقة",
            dropKey: addOfferLocData.region,
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            onChange: addOfferLocData.setSelectRegion,
            finData: (filter) async =>
                await CustomerRepository(context).getRegionData(),
            validate: (value) =>
                Validator().validateDropDown<DropDownModel>(model: value),
          ),
          DropdownTextField<DropDownModel>(
            label: "اسم المدينة",
            dropKey: addOfferLocData.city,
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            onChange: addOfferLocData.setSelectCity,
            validate: (value) =>
                Validator().validateDropDown<DropDownModel>(model: value),
            finData: (filter) async =>
                await CustomerRepository(context).getCitiesData(addOfferLocData.regionId!),
          ),
          DropdownTextField<DropDownModel>(
            label: "اسم الحي",
            dropKey: addOfferLocData.neighbor,
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            onChange: addOfferLocData.setSelectNeighbor,
            validate: (value) =>
                Validator().validateDropDown<DropDownModel>(model: value),
            finData: (filter) async =>
                await CustomerRepository(context).getNeighborsData(addOfferLocData.cityId!),
          ),
        ],
      ),
    );
  }

  Widget _buildNavButton(BuildContext context) {
    return InkWell(
      onTap: () => addOfferLocData.navigateToAddDetails(widget.model, context),
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
