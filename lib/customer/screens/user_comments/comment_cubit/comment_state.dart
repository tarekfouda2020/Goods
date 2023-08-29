part of 'comment_cubit.dart';

abstract class CommentState extends Equatable {
  final List<CommentModel>? comments;
  final bool? change;
  const CommentState({this.comments, this.change});
}

class CommentInitial extends CommentState {
  CommentInitial() : super(comments: [],change: false);
  @override
  List<Object> get props => [comments!,change!];
}

class CommentUpdated extends CommentState {
  CommentUpdated({List<CommentModel>? comments, bool? change}) : super(comments: comments!,change: change!);
  @override
  List<Object> get props => [comments!,change!];
}
