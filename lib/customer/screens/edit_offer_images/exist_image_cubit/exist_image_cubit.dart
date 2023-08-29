// ignore_for_file: use_build_context_synchronously

import 'package:auto_route/auto_route.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:heraggoods/customer/models/ImageModel.dart';
import 'package:heraggoods/customer/resources/CustomerRepository.dart';

part 'exist_image_state.dart';

class ExistImageCubit extends Cubit<ExistImageState> {
  ExistImageCubit() : super(ExistImageInitial());

  onExistImageUpdated(List<ImageModel> images){
    emit(ExistImageUpdated(images,!state.change));
  }

  onExistImageRemove(int index,BuildContext context)async{
    var result = await CustomerRepository(context).removeAdImage(state.images[index].id);
    if(result){
      state.images.removeAt(index);
      emit(ExistImageUpdated(state.images,!state.change));
      AutoRouter.of(context).pop();
    }
  }

}
