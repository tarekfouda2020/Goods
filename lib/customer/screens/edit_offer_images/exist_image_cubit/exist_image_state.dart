part of 'exist_image_cubit.dart';

abstract class ExistImageState extends Equatable {
  final List<ImageModel> images;
  final bool change;
  const ExistImageState(this.images,this.change);
}

class ExistImageInitial extends ExistImageState {
  ExistImageInitial() : super([], false);

  @override
  List<Object> get props => [images,change];
}

class ExistImageUpdated extends ExistImageState {
  const ExistImageUpdated(List<ImageModel> images, bool change) : super(images, change);


  @override
  List<Object> get props => [images,change];
}
