// ignore_for_file: use_build_context_synchronously, file_names

part of 'UserCommentsImports.dart';

class UserCommentsData {
  final CommentCubit commentCubit = CommentCubit();
  final GlobalKey<FormState> formKey = GlobalKey();
  final GlobalKey<FormState> repFormKey = GlobalKey();
  final TextEditingController comment = TextEditingController();
  final TextEditingController reply = TextEditingController();

  void setAddComment(BuildContext context, String id) async {
    if (formKey.currentState!.validate()) {
      await commentCubit.setAddComment(context, id, comment.text);
      comment.clear();
      AutoRouter.of(context).pop();
    }
  }
}
