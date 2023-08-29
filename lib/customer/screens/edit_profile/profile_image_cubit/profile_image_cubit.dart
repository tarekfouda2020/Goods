import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'profile_image_state.dart';

class ProfileImageCubit extends Cubit<ProfileImageState> {
  ProfileImageCubit() : super(const ProfileImageInitial());

  onImageUpdated(File image){
    emit(ProfileImageUpdate(image,!state.changed));
  }

}
