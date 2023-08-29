part of 'follower_user_cubit.dart';

abstract class FollowerUserState extends Equatable {
  final List<UserFollowerModel> followers;
  final bool change ;
  const FollowerUserState({required this.followers, required this.change});
}

class FollowerUserInitial extends FollowerUserState {
  FollowerUserInitial() : super(followers: [],change: false);

  @override
  List<Object> get props => [followers,change];
}
class FollowerUserUpdated extends FollowerUserState {
  const FollowerUserUpdated(List<UserFollowerModel> followers,bool change) :
        super(followers: followers,change: change);

  @override
  List<Object> get props => [followers,change];
}