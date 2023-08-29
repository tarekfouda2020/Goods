import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'call_image_state.dart';

class CallImageCubit extends Cubit<CallImageState> {
  CallImageCubit() : super(const CallImageInitial());

  onUpdateFile(File? file) {
    emit(CallImageUpdate(file ?? File("")));
  }
}
