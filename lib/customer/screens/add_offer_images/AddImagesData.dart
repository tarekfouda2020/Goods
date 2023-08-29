// ignore_for_file: file_names

part of 'AddOfferImagesImports.dart';

class AddImagesData {
  final AddAdsImagesCubit addOfferCubit =   AddAdsImagesCubit();

  void getImages(BuildContext context) async {
    List<File> images = await Utils.getImages();
    if (images.isNotEmpty) {
      images.addAll(addOfferCubit.state.images);
      addOfferCubit.onUpdateAdImages(images);
    }
  }

  void removeImage(File image, BuildContext context) {
    List<File> images = addOfferCubit.state.images;
    images.remove(image);
    addOfferCubit.onUpdateAdImages(List.from(images));
  }

  void navigateToDetails(BuildContext context, OffersHeaderModel headerModel) {
    var images = addOfferCubit.state.images;
    if (images.length > 5) {
      LoadingDialog.showSimpleToast("ادخل علي الاكثر ٥ صور");
      return;
    }
    if (images.isNotEmpty) {
      AddAdsModel model =
          AddAdsModel(images: images, fkHeaderAds: headerModel.id.toString());
      AutoRouter.of(context).push(AddOfferLocationRoute(model: model));
    } else {
      LoadingDialog.showSimpleToast("قم بادخال صور الإعلان");
    }
  }

  void reorderData(int oldIndex, int newIndex) {
    if (newIndex > oldIndex) {
      newIndex -= 1;
    }
    final items = addOfferCubit.state.images.removeAt(oldIndex);
    addOfferCubit.state.images.insert(newIndex, items);
    addOfferCubit.onUpdateAdImages(addOfferCubit.state.images);
  }
}
