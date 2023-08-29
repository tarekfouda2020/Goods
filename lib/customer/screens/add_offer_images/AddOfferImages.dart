// ignore_for_file: library_private_types_in_public_api, file_names

part of 'AddOfferImagesImports.dart';

class AddOfferImages extends StatefulWidget {
  final OffersHeaderModel model;

  const AddOfferImages({super.key, required this.model});

  @override
  _AddOfferImagesState createState() => _AddOfferImagesState();
}

class _AddOfferImagesState extends State<AddOfferImages> with AddImagesData {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        con: context,
        title: "صور الإعلان",
      ),
      backgroundColor: MyColors.white,
      body: _buildViewContainer(context),
    );
  }

  Widget _buildViewContainer(BuildContext context) {
    return Column(
      children: [
        _buildImageType("اضف ٥ صور للاعلان", true, context),
        BlocBuilder<AddAdsImagesCubit, AddAdsImagesState>(
          bloc: addOfferCubit,
          builder: (context, state) {
            return Flexible(
              child: ReorderableListView(
                padding: const EdgeInsets.all(25),
                onReorder: reorderData,
                children: List.generate(state.images.length, (index) {
                  return _buildImagesView(context, state.images[index]);
                }),
              ),
            );
          },
        ),
        DefaultButton(
          margin: const EdgeInsets.all(20),
          title: "استمرار",
          onTap: () => navigateToDetails(context, widget.model),
        ),
      ],
    );
  }

  Widget _buildImageType(String title, bool multiple, BuildContext context) {
    return InkWell(
      onTap: () => getImages(context),
      child: Container(
        height: 100,
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: MyColors.primary, width: 1)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.add, size: 50, color: MyColors.black),
            MyText(
              title: title,
              size: 12,
              color: MyColors.black,
            )
          ],
        ),
      ),
    );
  }

  Widget _buildImagesView(BuildContext context, File image) {
    return Container(
      key: ValueKey(image),
      margin: const EdgeInsets.symmetric(vertical: 5),
      width: MediaQuery.of(context).size.width * .7,
      height: MediaQuery.of(context).size.height * .24,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: MyColors.primary, width: 1),
          image: DecorationImage(
              image: FileImage(image),
              colorFilter:
                  const ColorFilter.mode(Colors.black12, BlendMode.darken),
              fit: BoxFit.fill)),
      alignment: Alignment.topLeft,
      child: InkWell(
        child: Container(
          decoration: BoxDecoration(
            color: MyColors.white,
            shape: BoxShape.circle,
          ),
          padding: const EdgeInsets.all(5.0),
          child: Icon(
            Icons.close,
            size: 25,
            color: MyColors.primary,
          ),
        ),
        onTap: () => removeImage(image, context),
      ),
    );
  }
}
