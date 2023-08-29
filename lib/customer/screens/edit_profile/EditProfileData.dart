// ignore_for_file: no_leading_underscores_for_local_identifiers, use_build_context_synchronously, file_names

part of 'EditProfileImports.dart';

class EditProfileData {
  final ProfileImageCubit profileImageCubit = ProfileImageCubit();
  final ProfileCoverCubit profileCoverCubit = ProfileCoverCubit();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController name = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController mail = TextEditingController();
  final TextEditingController phone1 = TextEditingController();
  final TextEditingController phone2 = TextEditingController();
  final TextEditingController phone3 = TextEditingController();
  final TextEditingController address = TextEditingController();
  final TextEditingController cardId = TextEditingController();
  final TextEditingController desc = TextEditingController();

  void initUserData(UserModel user, BuildContext context) {
    name.text = user.userName ?? "";
    mail.text = user.email ?? "";
    phone.text = user.phone ?? "";
    phone1.text = user.phone1 ?? "";
    phone2.text = user.phone2 ?? "";
    phone3.text = user.phone3 ?? "";
    address.text = user.address ?? "";
    cardId.text = user.uniqId ?? "";
    desc.text = user.description ?? "";
    context.read<LocationCubit>().onLocationUpdated(
        LocationModel(user.lat!, user.lng!, user.address!),
        change: true);
  }

  void setProfileImage() async {
    var _img = await Utils.getImage();
    if (_img != null) {
      profileImageCubit.onImageUpdated(_img);
    }
  }

  void setCoverImage() async {
    var _img = await Utils.getImage();
    if (_img != null) {
      profileCoverCubit.onUpdateCover(_img);
    }
  }

  void navigateToLocationAddress(BuildContext context) async {
    await Utils.navigateToLocationAddress(context);
  }

  void setUpdateProfile(BuildContext context) async {
    FocusScope.of(context).requestFocus(FocusNode());
    if (formKey.currentState!.validate()) {
      UpdateProfileModel model = UpdateProfileModel(
        userName: name.text,
        phone: phone.text,
        phone1: phone1.text,
        phone2: phone2.text,
        phone3: phone3.text,
        address: address.text,
        lat: context.read<LocationCubit>().state.model.lat,
        lng: context.read<LocationCubit>().state.model.lng,
        description: desc.text,
        email: mail.text,
        imgCover: profileCoverCubit.state.image,
        imgProfile: profileImageCubit.state.image,
      );
      var result = await CustomerRepository(context).updateUserData(model);
      if (result) {
        AutoRouter.of(context).pop();
      }
    }
  }
}
