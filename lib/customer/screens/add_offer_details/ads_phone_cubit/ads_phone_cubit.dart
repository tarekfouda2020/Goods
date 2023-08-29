import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'ads_phone_state.dart';

class AdsPhoneCubit extends Cubit<AdsPhoneState> {
  AdsPhoneCubit() : super(const AdsPhoneInitial());

  onUpdatePhone({required bool showPhone,}){
    emit(AdsPhoneUpdated(showPrice: state.showPrice,showPhone: showPhone));
  }

  onUpdatePrice({required bool showPrice,}){
    emit(AdsPhoneUpdated(showPrice: showPrice,showPhone: state.showPhone));
  }
}
