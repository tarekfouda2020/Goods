part of 'edit_images_cubit.dart';

abstract class EditImagesState extends Equatable {
  final List<File> images;
  final bool change;
  const EditImagesState({required this.images, required this.change});
}

class EditImagesInitial extends EditImagesState {
  EditImagesInitial() : super(images: [],change: false);

  @override
  List<Object> get props => [images,change];
}

class EditImagesUpdated extends EditImagesState {
  const EditImagesUpdated(List<File> images, bool change)
      : super(images: images,change: change);

  @override
  List<Object> get props => [images,change];
}