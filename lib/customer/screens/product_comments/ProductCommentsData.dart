// ignore_for_file: use_build_context_synchronously, file_names

part of 'ProCommentsImports.dart';

class ProductCommentsData {
  final CommentCubit commentCubit = CommentCubit();
  final GlobalKey<FormState> formKey = GlobalKey();
  final GlobalKey<FormState> repFormKey = GlobalKey();
  final TextEditingController comment = TextEditingController();
  final TextEditingController reply = TextEditingController();

  void setAddComment(BuildContext context, int id) async {
    if (formKey.currentState!.validate()) {
      await commentCubit.setAddComment(context, id, comment.text);
      AutoRouter.of(context).pop();
      HomeMainData().pagingController.refresh();
    }
  }

  void setAddReply(BuildContext context, int id) async {
    if (repFormKey.currentState!.validate()) {
      await commentCubit.setAddReply(context, id, reply.text);
      AutoRouter.of(context).pop();
    }
  }
}
