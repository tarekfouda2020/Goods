part of 'follower_ads_cubit.dart';

abstract class FollowerAdsState extends Equatable {
  final List<AdsModel> ads;
  final bool change ;
  const FollowerAdsState({required this.ads, required this.change});
}

class FollowerAdsInitial extends FollowerAdsState {
  FollowerAdsInitial() : super(ads: [],change: false);

  @override
  List<Object> get props => [ads,change];
}

class FollowerAdsUpdated extends FollowerAdsState {
  const FollowerAdsUpdated(List<AdsModel> ads,bool change) : super(ads: ads,change: change);

  @override
  List<Object> get props => [ads,change];
}