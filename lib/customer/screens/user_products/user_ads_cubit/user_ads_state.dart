part of 'user_ads_cubit.dart';

abstract class UserAdsState extends Equatable {
  final List<AdsModel> ads;
  final bool change ;
  const UserAdsState({required this.ads, required this.change});
}

class UserAdsInitial extends UserAdsState {
  UserAdsInitial() : super(ads: [],change: false);

  @override
  List<Object> get props => [ads,change];
}

class UserAdsUpdated extends UserAdsState {
  const UserAdsUpdated(List<AdsModel> ads,bool change) : super(ads: ads,change: change);

  @override
  List<Object> get props => [ads,change];
}
