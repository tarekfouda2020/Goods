import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'profile_cover_state.dart';

class ProfileCoverCubit extends Cubit<ProfileCoverState> {
  ProfileCoverCubit() : super(const ProfileCoverInitial());

  onUpdateCover(File image){
    emit(ProfileCoverUpdate(image));
  }

}
