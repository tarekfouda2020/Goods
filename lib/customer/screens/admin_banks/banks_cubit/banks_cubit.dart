import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:heraggoods/customer/models/BankModel.dart';
import 'package:heraggoods/customer/resources/CustomerRepository.dart';

part 'banks_state.dart';

class BanksCubit extends Cubit<BanksState> {
  BanksCubit() : super(BanksInitial());

  onUpdateBanks(List<BankModel> banks){
    emit(BanksUpdateState(banks, !state.changed));
  }

  void fetchData(BuildContext context)async{
    List<BankModel> data = await CustomerRepository(context).getBanks();
    onUpdateBanks(data);
  }

}
