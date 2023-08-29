// ignore_for_file: library_private_types_in_public_api, file_names

part of 'EditProfileImports.dart';

class EditProfile extends StatefulWidget {
  final UserModel user;

  const EditProfile({super.key, required this.user});
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> with EditProfileData {
  @override
  void initState() {
    super.initState();
    LocationModel locationModel =
        LocationModel(widget.user.lat!, widget.user.lng!, "");
    context.read<LocationCubit>().onLocationUpdated(locationModel);
    initUserData(widget.user, context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(title: "حسابي", con: context),
      body: ListView(
        children: [
          Container(
            height: 200,
            alignment: Alignment.center,
            child: Stack(
              alignment: Alignment.center,
              children: [
                BlocBuilder<ProfileCoverCubit, ProfileCoverState>(
                  bloc: profileCoverCubit,
                  builder: (context, state) {
                    if (state is ProfileCoverUpdate) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        height: 200,
                        alignment: Alignment.topLeft,
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: MyColors.greyWhite, width: 1),
                          image: DecorationImage(
                              image: FileImage(state.image!),
                              colorFilter: const ColorFilter.mode(
                                  Colors.black26, BlendMode.darken),
                              fit: BoxFit.fill),
                        ),
                        child: IconButton(
                          icon: const Icon(
                            Icons.camera_alt,
                            size: 20,
                            color: Colors.white,
                          ),
                          onPressed: setCoverImage,
                        ),
                      );
                    } else {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        height: 200,
                        alignment: Alignment.topLeft,
                        decoration: BoxDecoration(
                            color: Colors.black12,
                            image: DecorationImage(
                              image: NetworkImage(widget.user.imgCover!),
                              colorFilter: const ColorFilter.mode(
                                  Colors.black26, BlendMode.darken),
                              fit: BoxFit.fill,
                            ),
                            border: Border.all(
                                color: MyColors.greyWhite, width: 1)),
                        child: IconButton(
                          icon: const Icon(
                            Icons.camera_alt,
                            size: 20,
                            color: Colors.white,
                          ),
                          onPressed: setCoverImage,
                        ),
                      );
                    }
                  },
                ),
                BlocBuilder<ProfileImageCubit, ProfileImageState>(
                  bloc: profileImageCubit,
                  builder: (context, state) {
                    if (state is ProfileImageUpdate) {
                      return Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: MyColors.greyWhite, width: 1),
                            image: DecorationImage(
                                image: FileImage(state.image!),
                                colorFilter: const ColorFilter.mode(
                                    Colors.black26, BlendMode.darken),
                                fit: BoxFit.fill)),
                        child: IconButton(
                          icon: const Icon(
                            Icons.camera_alt,
                            size: 20,
                            color: Colors.white,
                          ),
                          onPressed: setProfileImage,
                        ),
                      );
                    } else {
                      return Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                            color: Colors.black12,
                            image: DecorationImage(
                              image: NetworkImage(widget.user.imgProfile!),
                              colorFilter: const ColorFilter.mode(
                                  Colors.black26, BlendMode.darken),
                              fit: BoxFit.fill,
                            ),
                            border: Border.all(
                                color: MyColors.greyWhite, width: 1)),
                        child: IconButton(
                          icon: const Icon(
                            Icons.camera_alt,
                            size: 20,
                            color: Colors.white,
                          ),
                          onPressed: setProfileImage,
                        ),
                      );
                    }
                  },
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 50),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  LabelTextField(
                    controller: name,
                    label: "اسم المستخدم",
                    margin:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    action: TextInputAction.next,
                    validate: (value) =>
                        Validator().validateEmpty(value: value),
                    type: TextInputType.text,
                  ),
                  LabelTextField(
                    controller: phone,
                    label: "رقم الجوال",
                    margin:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    action: TextInputAction.next,
                    validate: (value) =>
                        Validator().validatePhone(value: value),
                    type: TextInputType.number,
                  ),
                  LabelTextField(
                    controller: mail,
                    label: "البريد الالكتروني",
                    margin:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    action: TextInputAction.next,
                    validate: (value) =>
                        Validator().validateEmailORNull(value: value),
                    type: TextInputType.emailAddress,
                  ),
                  BlocConsumer<LocationCubit, LocationState>(
                    listener: (context, state) {
                      address.text = state.model.address;
                    },
                    builder: (context, state) {
                      return InkWellTextField(
                        controller: address,
                        label: "العنوان",
                        margin: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 5),
                        type: TextInputType.text,
                        icon: Icon(
                          Icons.location_on,
                          size: 20,
                          color: MyColors.primary,
                        ),
                        onTab: () => navigateToLocationAddress(context),
                      );
                    },
                  ),
                  // LabelTextField(
                  //   controller: cardId,
                  //   label: "رقم البطاقة",
                  //   margin: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                  //   action: TextInputAction.next,
                  //   validate: (value)=>Validator().noValidate(value: value),
                  //   type: TextInputType.number,
                  // ),
                  RichTextFiled(
                    controller: desc,
                    margin:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    height: 100,
                    label: "الوصف",
                    validate: (value) => Validator().noValidate(value: value),
                    action: TextInputAction.done,
                    max: 10,
                    min: 6,
                    submit: (value) => setUpdateProfile(context),
                  ),
                ],
              ),
            ),
          ),
          DefaultButton(
            onTap: () => setUpdateProfile(context),
            title: "حفظ التعديلات",
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          ),
          DefaultButton(
            onTap: () =>
                AutoRouter.of(context).push(const ChangePasswordRoute()),
            title: "تعديل كلمة المرور",
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            color: Colors.transparent,
            borderColor: MyColors.primary,
            textColor: MyColors.primary,
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
