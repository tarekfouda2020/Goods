import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'edit_images_state.dart';

class EditImagesCubit extends Cubit<EditImagesState> {
  EditImagesCubit() : super(EditImagesInitial());


  onOfferImageUpdated(List<File> images){
    emit(EditImagesUpdated(images,!state.change));
  }

  onOfferImageRemove(File images){
    state.images.remove(images);
    emit(EditImagesUpdated(state.images,!state.change));
  }


}
