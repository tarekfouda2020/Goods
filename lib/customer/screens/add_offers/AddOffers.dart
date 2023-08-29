// ignore_for_file: file_names, library_private_types_in_public_api

part of 'AddOfferImports.dart';

class AddOffers extends StatefulWidget {
  const AddOffers({super.key});

  @override
  _AddOffersState createState() => _AddOffersState();
}

class _AddOffersState extends State<AddOffers> {
  @override
  void initState() {
    context
        .read<OfferHeadersCubit>()
        .fetchOfferHeadersData(context, refresh: false);
    context.read<OfferHeadersCubit>().fetchOfferHeadersData(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(title: "اضافة عرض", con: context),
      body: BlocBuilder<OfferHeadersCubit, OfferHeadersState>(
        bloc: context.watch<OfferHeadersCubit>(),
        builder: (context, state) {
          if (state is OfferHeadersUpdate) {
            return _buildOffersListView(state.headers);
          } else {
            return _buildLoadingView();
          }
        },
      ),
    );
  }

  ListView _buildOffersListView(List<OffersHeaderModel> headers) {
    return ListView.builder(
      itemCount: headers.length,
      itemBuilder: (context, index) {
        return _buildListTileItem(index, headers[index], context);
      },
    );
  }

  Widget _buildListTileItem(
      int index, OffersHeaderModel model, BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: MyText(
            title: model.title,
            size: 10,
            color: MyColors.blackOpacity,
          ),
          leading: model.icon.toLowerCase().contains(".svg")
              ? _buildSvgIcon(model.icon)
              : _buildImgIcon(model.icon),
          onTap: () =>
              AutoRouter.of(context).push(OfferSwearingRoute(model: model)),
          focusColor: MyColors.primary,
          hoverColor: MyColors.primary,
        ),
        Divider(
          color: MyColors.greyWhite,
          thickness: 1,
          height: 10,
        )
      ],
    );
  }

  Widget _buildLoadingView() {
    return Center(
      child: LoadingDialog.showLoadingView(),
    );
  }

  Widget _buildSvgIcon(String icon) {
    return SvgPicture.network(icon,
        semanticsLabel: '',
        width: 25,
        height: 25,
        placeholderBuilder: (BuildContext context) => SpinKitFadingCircle(
              color: MyColors.primary,
              size: 30.0,
            ));
  }

  Widget _buildImgIcon(String icon) {
    return CachedImage(url: icon, width: 35, height: 35);
  }
}
