part of 'ads_phone_cubit.dart';

abstract class AdsPhoneState extends Equatable {
  final bool showPhone;
  final bool showPrice;
  const AdsPhoneState({required this.showPhone, required this.showPrice});
}

class AdsPhoneInitial extends AdsPhoneState {
  const AdsPhoneInitial() : super(showPhone: false,showPrice: false);

  @override
  List<Object> get props => [showPrice,showPhone];
}

class AdsPhoneUpdated extends AdsPhoneState {
  const AdsPhoneUpdated({required bool showPhone, required bool showPrice}) : super(showPhone: showPhone,showPrice: showPrice);

  @override
  List<Object> get props => [showPrice,showPhone];
}
