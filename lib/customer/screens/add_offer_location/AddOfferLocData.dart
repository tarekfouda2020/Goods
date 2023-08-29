// ignore_for_file: unnecessary_null_comparison, prefer_null_aware_operators, file_names

part of 'AddOfferLocImports.dart';

class AddOfferLocData {
  final GlobalKey<ScaffoldState> scaffold = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController address = TextEditingController();
  final GlobalKey<DropdownSearchState<DropDownModel>> region = GlobalKey();
  final GlobalKey<DropdownSearchState<DropDownModel>> city = GlobalKey();
  final GlobalKey<DropdownSearchState<DropDownModel>> neighbor = GlobalKey();
  String? regionId;
  String? cityId;
  String? neighborId;

  void setSelectRegion(DropDownModel model) {
    regionId = model != null ? model.id.toString() : null;
    city.currentState!.changeSelectedItem(null);
    neighbor.currentState!.changeSelectedItem(null);
  }

  void setSelectCity(DropDownModel model) {
    cityId = model != null ? model.id.toString() : null;
    neighbor.currentState!.changeSelectedItem(null);
  }

  void setSelectNeighbor(DropDownModel model) {
    neighborId = model != null ? model.id.toString() : null;
  }

  void navigateToAddDetails(AddAdsModel model, BuildContext context) {
    if (formKey.currentState!.validate()) {
      if (address.text.isEmpty) {
        LoadingDialog.showSimpleToast("قم بتحديد العنوان");
        return;
      }
      LocationModel locationModel = context.read<LocationCubit>().state.model;
      model.fkRegion = regionId;
      model.fkCity = cityId;
      model.fkDistrict = neighborId;
      model.lat = locationModel.lat;
      model.lng = locationModel.lng;
      model.location = locationModel.address;
      AutoRouter.of(context).push(AddOfferDetailsRoute(model: model));
    }
  }

  void navigateToLocationAddress(BuildContext context) async {
    await Utils.navigateToLocationAddress(context);
  }
}
