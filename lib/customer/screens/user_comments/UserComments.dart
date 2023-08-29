// ignore_for_file: file_names, library_private_types_in_public_api

part of 'UserCommentsImports.dart';

class UserComments extends StatefulWidget {
  final String userId;
  const UserComments({super.key,  required this.userId});

  @override
  _UserCommentsState createState() => _UserCommentsState();
}

class _UserCommentsState extends State<UserComments> with UserCommentsData {

  @override
  void initState() {
    commentCubit.setFetchData(context,widget.userId,refresh: false);
    commentCubit.setFetchData(context,widget.userId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        title: "التعليقات",
        con: context,
      ),
      backgroundColor: MyColors.white,

      body: BlocBuilder<CommentCubit,CommentState>(
        bloc: commentCubit,
        builder: (context,state){
          if(state is CommentUpdated){
            if(state.comments!.isNotEmpty){
              return _buildCommentList(context,  state.comments!);
            }else{
              return Center(
                child: MyText(title: "لايوجد بيانات",size: 12,color: MyColors.blackOpacity,),
              );
            }
          }else{
            return _buildLoadingView();
          }
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: ()=> _buildAddCommentDialog(context),
        backgroundColor: MyColors.primary,
        child: Icon(Icons.add,size: 25,color: MyColors.white,),

      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }


  Widget _buildLoadingView(){
    return Center(
      child: LoadingDialog.showLoadingView(),
    );
  }

  Widget _buildCommentList(BuildContext context,List<CommentModel> comments){
    return ListView.builder(
      physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      padding:const EdgeInsets.only(bottom: 80),
      itemCount: comments.length,
      itemBuilder: (context,index){
        return _buildCommentView(context,comments[index]);
      },
    );
  }

  Widget _buildCommentView(BuildContext context,CommentModel model){
    return Container(
      padding:const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
      decoration: BoxDecoration(
          color: MyColors.greyWhite.withOpacity(.1),
          border: Border(
              bottom: BorderSide(color: MyColors.grey.withOpacity(.5),width: 1)
          )
      ),
      child: Column(
        children: [
          Row(
            children: [
             const Icon(Icons.person,size: 20,color: Colors.black87,),
              MyText(title: model.userName,size: 10,color: Colors.black87,),
            const  Spacer(),
              MyText(title: model.creationDate,size: 10,color: Colors.black45,)
            ],
          ),
          Container(
            padding:const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: [
                MyText(
                  title: model.text,
                  size: 10,
                  color: MyColors.blackOpacity,
                ),
              ],
            ),
          ),
          Visibility(
            visible: model.fKUser==Utils.getCurrentUserId(context: context),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: ()=>_buildConfirmRemoveComment(model),
                  child:const Icon(Icons.delete,size: 20,color: Colors.black87,),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void _buildAddCommentDialog(BuildContext context){
    showCupertinoDialog(
      context: context,
      builder: (context){
        return  AlertDialog(
          backgroundColor: MyColors.white,
          titlePadding:const EdgeInsets.all(0),
          contentPadding:const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
          title: Container(
            height: 40,
            padding:const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                color: MyColors.primary,
                borderRadius: BorderRadius.circular(4)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyText(title: "تعليق",size: 12,color: Colors.black87,),
                InkWell(
                  child:const Icon(Icons.close,size: 25,color: Colors.black87,),
                  onTap: ()=>Navigator.of(context).pop(),
                )
              ],
            ),
          ),

          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Form(
                key: formKey,
                child: RichTextFiled(
                  controller: comment,
                  height: 100,
                  label: "اكتب تعليقك ....",
                  max: 10,
                  min: 6,
                  submit: (value)=>setAddComment(context,widget.userId),
                  validate: (value)=>Validator().validateEmpty(value: value),
                ),
              ),
              DefaultButton(title: "ارسال", onTap: ()=>setAddComment(context,widget.userId))
            ],
          ),

        );
      },
    );
  }


  void _buildConfirmRemoveComment(CommentModel model){
    LoadingDialog.showConfirmDialog(
        context: context,
        title: "تأكيد حذف التعليق",
      confirm: ()=>commentCubit.setRemoveComment(context, model)
    );
  }

}

