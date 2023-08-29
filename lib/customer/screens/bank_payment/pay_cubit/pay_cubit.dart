import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'pay_state.dart';

class PayCubit extends Cubit<PayState> {
  PayCubit() : super(const PayInitial());

  onUpdatePayImage(File image){
    emit(PayUpdateState(image));
  }

}
