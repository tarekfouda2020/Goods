// ignore_for_file: use_build_context_synchronously

import 'package:auto_route/auto_route.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:heraggoods/customer/models/UserFollowerModel.dart';
import 'package:heraggoods/customer/resources/CustomerRepository.dart';

part 'follower_user_state.dart';

class FollowerUserCubit extends Cubit<FollowerUserState> {
  FollowerUserCubit() : super(FollowerUserInitial());

  onUpdateAdsList(List<UserFollowerModel> followers){
    emit(FollowerUserUpdated(followers, !state.change));
  }

  fetchFollowedUsers(BuildContext context,{bool refresh = true})async{
    List<UserFollowerModel> data = await CustomerRepository(context).getFollowedUsers(refresh);
    onUpdateAdsList(data);
  }

  removeFollowUser(BuildContext context,UserFollowerModel model)async{
    var result = await CustomerRepository(context).removeFollowUser(model.id.toString());
    if(result){
      AutoRouter.of(context).pop();
      state.followers.remove(model);
      onUpdateAdsList(state.followers);
    }
  }

}
