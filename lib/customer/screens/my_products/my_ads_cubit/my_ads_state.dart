part of 'my_ads_cubit.dart';

abstract class MyAdsState extends Equatable {
  final List<EditAdModel> ads;
  final bool change ;
  const MyAdsState({required this.ads, required this.change});
}

class MyAdsInitial extends MyAdsState {
  MyAdsInitial() : super(ads: [],change: false);

  @override
  List<Object> get props => [ads,change];
}

class MyAdsUpdated extends MyAdsState {
  const MyAdsUpdated(List<EditAdModel> ads,bool change) : super(ads: ads,change: change);

  @override
  List<Object> get props => [ads,change];
}
