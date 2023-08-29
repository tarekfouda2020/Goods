// ignore_for_file: unnecessary_null_comparison

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:heraggoods/customer/models/ContactModel.dart';
import 'package:heraggoods/customer/resources/CustomerRepository.dart';

part 'call_social_state.dart';

class CallSocialCubit extends Cubit<CallSocialState> {
  CallSocialCubit() : super(const CallSocialInitial());

  onUpdateModel(ContactModel model){
    emit(CallSocialUpdate(model, !state.change));
  }

  void fetchData(BuildContext context)async{
    var data = await CustomerRepository(context).getContactInfo();
    if(data!=null){
      onUpdateModel(data);
    }
  }

}
