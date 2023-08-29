part of 'favourite_cubit.dart';

abstract class FavouriteState extends Equatable {
  final int count;
  final bool fav;
  final bool follow;
  const FavouriteState({required this.count, required this.fav,required this.follow});
}

class FavouriteInitial extends FavouriteState {
  const FavouriteInitial():super(count: 0,fav: false,follow: false);
  @override
  List<Object> get props => [fav,count,follow];
}

class FavouriteUpdated extends FavouriteState {
  const FavouriteUpdated(bool fav,bool follow,int count):super(count: count,fav: fav,follow: follow);
  @override
  List<Object> get props => [fav,count,follow];
}
