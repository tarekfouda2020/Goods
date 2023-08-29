import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'add_ads_images_state.dart';

class AddAdsImagesCubit extends Cubit<AddAdsImagesState> {
  AddAdsImagesCubit() : super(AddAdsImagesInitial());

  onUpdateAdImages(List<File> images){
    emit(AddAdsImagesUpdated(images, !state.changed));
  }

}
