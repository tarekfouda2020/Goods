// ignore_for_file: use_build_context_synchronously

import 'package:auto_route/auto_route.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
 import 'package:heraggoods/customer/resources/CustomerRepository.dart';
import 'package:heraggoods/customer/screens/user_products/ad_owner_cubit/add_owner_cubit.dart';

part 'rate_user_state.dart';

class RateUserCubit extends Cubit<RateUserState> {
  RateUserCubit() : super(const RateUserInitial());

  onUpdateRateValue(double rate){
    emit(RateUserUpdated(rate: rate, preRate: null));
  }


  setRateUser(BuildContext context,String userId,AddOwnerCubit addOwnerCubit)async{
    int result = await CustomerRepository(context).addUserRate(userId ,state.rate.toInt());
    if(result!=0){
      addOwnerCubit.onUpdateRate(true);
    }
    AutoRouter.of(context).pop();

  }

}
