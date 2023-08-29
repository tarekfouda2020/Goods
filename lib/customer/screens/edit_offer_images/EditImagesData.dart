// ignore_for_file: file_names

part of 'EditOfferImagesImports.dart';

class EditImagesData {
  final EditImagesCubit editImagesCubit =   EditImagesCubit();

  final ExistImageCubit existImageCubit =   ExistImageCubit();

  void getImages(BuildContext context) async {
    List<File> images = await Utils.getImages();
    if (images.isNotEmpty) {
      editImagesCubit.onOfferImageUpdated(images);
    }
  }

  void removeImage(File image, BuildContext context) {
    editImagesCubit.onOfferImageRemove(image);
  }

  void removeExistImage(int index, BuildContext context) {
    existImageCubit.onExistImageRemove(index, context);
  }

  void navigateToDetails(BuildContext context, AdsDataModel adsDataModel) {
    var images = editImagesCubit.state.images;
    var exists = existImageCubit.state.images;
    if ((images.length + exists.length) > 5) {
      LoadingDialog.showSimpleToast("ادخل علي الاكثر ٥ صور");
      return;
    }
    if (images.isNotEmpty || exists.isNotEmpty) {
      UpdateAdModel model = UpdateAdModel(
          images: images,
          adsId: adsDataModel.id.toString(),
          title: adsDataModel.title);
      AutoRouter.of(context)
          .push(EditOfferLocationRoute(model: model, adModel: adsDataModel));
    } else {
      LoadingDialog.showSimpleToast("قم بادخال صور الإعلان");
    }
  }
}
