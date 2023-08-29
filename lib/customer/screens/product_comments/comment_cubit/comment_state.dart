part of 'comment_cubit.dart';

abstract class CommentState extends Equatable {
  final List<CommentModel> comments;
  final bool change;
  const CommentState({required this.comments, required this.change});
}

class CommentInitial extends CommentState {
  CommentInitial() : super(comments: [],change: false);
  @override
  List<Object> get props => [comments,change];
}

class CommentUpdated extends CommentState {
  const CommentUpdated({required List<CommentModel> comments, required bool change}) : super(comments: comments,change: change);
  @override
  List<Object> get props => [comments,change];
}
