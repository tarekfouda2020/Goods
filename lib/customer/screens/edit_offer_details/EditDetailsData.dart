// ignore_for_file: file_names

part of 'EditDetailsImports.dart';

class EditDetailsData {
  final GlobalKey<ScaffoldState> scaffold = GlobalKey();
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController title = TextEditingController();
  final TextEditingController desc = TextEditingController();
  final TextEditingController file = TextEditingController();

  final MapReplyCubit mapReplyCubit = MapReplyCubit();
  final GenericCubit<File?> fileCubit = GenericCubit(null);
  final TextEditingController phone = TextEditingController();
  final TextEditingController price = TextEditingController();

  final GenericCubit<bool> phoneCubit = GenericCubit(false);
  final GenericCubit<bool> priceCubit = GenericCubit(false);

  void setFileVideo() async {
    var video = await Utils.getVideo();
    if (video != null) {
      fileCubit.onUpdateData(video);
    }
  }

  void setAddOffer(BuildContext context, UpdateAdModel model) {
    if (formKey.currentState!.validate()) {
      model.closeReply = (mapReplyCubit.state.closeReply).toString();
      model.showMap = mapReplyCubit.state.showMap.toString();
      model.lang = context.read<LangBloc>().state.lang;
      model.description = desc.text;
      model.title = title.text;
      model.video = fileCubit.state.data;
      model.showPhone = (phoneCubit.state.data).toString();
      model.phone = Utils.convertDigitsToLatin(phone.text);
      model.price = Utils.convertDigitsToLatin(price.text);
      model.determinePrice = (priceCubit.state.data).toString();
      debugPrint(model.toJson().toString());
      CustomerRepository(context).setEditOffer(model).then((value) {
        if (value) {
           HomeMainData().pagingController.refresh();
          AutoRouter.of(context).popAndPush(const EditOfferSuccessRoute());
        }
      });
    }
  }
}
