// ignore_for_file: unnecessary_null_comparison, use_build_context_synchronously

import 'package:auto_route/auto_route.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:heraggoods/customer/models/CommentModel.dart';
import 'package:heraggoods/customer/models/ReplyModel.dart';
import 'package:heraggoods/customer/resources/CustomerRepository.dart';
import 'package:heraggoods/general/blocs/lang_bloc/lang_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'comment_state.dart';

class CommentCubit extends Cubit<CommentState> {
  CommentCubit() : super(CommentInitial());

  onSetCommentsList(List<CommentModel> comments) {
    emit(CommentUpdated(comments: comments, change: !state.change));
  }

  setFetchData(BuildContext context, int id, {bool refresh = true}) async {
    String lang = context.read<LangBloc>().state.lang;
    var comments =
        await CustomerRepository(context).getAdComments("$id", lang, refresh);
    onSetCommentsList(comments);
  }

  Future<void> setAddComment(BuildContext context, int id, String text) async {
    var comment = await CustomerRepository(context).addAdComments("$id", text);
    if (comment != null) {
      state.comments.add(comment);
      onSetCommentsList(state.comments);
    }
  }

  Future<void> setAddReply(BuildContext context, int id, String reply) async {
    var replyModel = await CustomerRepository(context).addAdReply("$id", reply);
    if (replyModel != null) {
      state.comments
          .where((element) => element.id == id)
          .first
          .replyList!
          .add(replyModel);
      onSetCommentsList(state.comments);
    }
  }

  Future<void> setRemoveComment(
      BuildContext context, CommentModel model) async {
    var result = await CustomerRepository(context).removeComment("${model.id}");
    if (result) {
      state.comments.remove(model);
      onSetCommentsList(state.comments);
      AutoRouter.of(context).pop();
    }
  }

  Future<void> setRemoveReply(
      BuildContext context, int index, ReplyModel model) async {
    var result = await CustomerRepository(context).removeReply("${model.id}");
    if (result) {
      state.comments[index].replyList!.remove(model);
      onSetCommentsList(state.comments);
      AutoRouter.of(context).pop();
    }
  }
}
