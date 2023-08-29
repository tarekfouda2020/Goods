// ignore_for_file: file_names, library_private_types_in_public_api

part of 'FavouriteImports.dart';

class Favourite extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffold;

  const Favourite({super.key,  required this.scaffold});
  @override
  _FavouriteState createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {

  final RefreshController refreshController = RefreshController(initialRefresh: false);

 @override
  void initState() {
   context.read<WishListCubit>().setFetchFavList(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(con: context,title: "المفضلة",leading: Container(),),
      body: BlocBuilder<WishListCubit,WishListState>(
        bloc: context.watch<WishListCubit>(),
        builder: (context,state){
         if(state is WishListUpdated){
           if(state.ads.isNotEmpty){
             return _buildListFavourite(state.ads);
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
    );
  }

  Widget _buildLoadingView(){
    return Center(
      child: LoadingDialog.showLoadingView(),
    );
  }

  Widget _buildListFavourite(List<AdsModel> lst){
    return CustomPullRefresh(
      controller: refreshController,
      onRefresh: ()=> context.read<WishListCubit>()..setRefreshData(context,refreshController),
      child: ListView.builder(
        itemCount: lst.length,
        itemBuilder: (con,index){
          return ProductRow(index: index,model: lst[index], adOwnerImg: '',);
        },

      ),
    );
  }

}



