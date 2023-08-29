// ignore_for_file: file_names

part of 'MyProductsImports.dart';

class MyProductsData {
  final MyAdsCubit myAdsCubit = MyAdsCubit();
  final RefreshController refreshController = RefreshController();

  void navigateTo(BuildContext context, EditAdModel model) {
    AutoRouter.of(context).push(EditOfferImagesRoute(model: model.info));
  }
}
