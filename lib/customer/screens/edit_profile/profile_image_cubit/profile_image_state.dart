part of 'profile_image_cubit.dart';

abstract class ProfileImageState extends Equatable {
  final File? image;
  final bool changed;
  const ProfileImageState(this.image,this.changed);
}

class ProfileImageInitial extends ProfileImageState {
  const ProfileImageInitial() : super(null,false);

  @override
  List<Object> get props => [image!,changed];
}

class ProfileImageUpdate extends ProfileImageState {
  const ProfileImageUpdate(File image,bool changed) : super(image,changed);

  @override
  List<Object> get props => [image!,changed];
}
