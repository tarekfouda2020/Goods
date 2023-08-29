// ignore_for_file: file_names, library_private_types_in_public_api, avoid_function_literals_in_foreach_calls

part of 'EditDetailsImports.dart';

class EditOfferDetails extends StatefulWidget {
  final UpdateAdModel model;
  final AdsDataModel adModel;
  const EditOfferDetails(
      {super.key, required this.model, required this.adModel});

  @override
  _AddOfferDetailsState createState() => _AddOfferDetailsState();
}

class _AddOfferDetailsState extends State<EditOfferDetails>
    with EditDetailsData {
  @override
  void initState() {
    title.text = widget.adModel.title;
    mapReplyCubit.onInitData(widget.adModel.showMap, widget.adModel.closeReply);
    phoneCubit.onUpdateData(widget.adModel.showPhone);
    phone.text = (widget.adModel.phone == "+966" || widget.adModel.phone == "+1"
        ? ""
        : widget.adModel.phone)!;
    price.text = widget.adModel.price.toString();
    priceCubit.onUpdateData(widget.adModel.showPrice);
    if (widget.adModel.fromAppOrNo) {
      List<dynamic> descList = json.decode(widget.adModel.description!);
      descList.forEach((element) {
        desc.text += element + " \n";
      });
    } else {
      desc.text = widget.adModel.description!;
    }
    if (widget.adModel.notes != null) {
      desc.text += desc.text.isEmpty
          ? widget.adModel.notes!
          : "\n${widget.adModel.notes!}";
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffold,
      backgroundColor: Colors.white,
      appBar: DefaultAppBar(title: "تفاصيل الإعلان", con: context),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: ListView(
          children: [
            _buildAddImagesView(),
            _buildInputFields(),
            BlocConsumer<GenericCubit<File?>, GenericState<File?>>(
              bloc: fileCubit,
              listener: (_, state) {
                if (state.data != null) {
                  file.text = state.data!.path.split("/").last;
                }
              },
              builder: (_, state) {
                return InkWellTextField(
                  label: "هل ترغب فى ارفاق فديو ؟",
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  controller: file,
                  icon: Icon(
                    Icons.file_upload,
                    size: 25,
                    color: MyColors.primary,
                  ),
                  onTab: () => setFileVideo(),
                );
              },
            ),
            _buildDescInput(),
            DefaultButton(
                margin: const EdgeInsets.all(20),
                title: "استمرار",
                onTap: () => setAddOffer(context, widget.model)),
          ],
        ),
      ),
    );
  }

  Widget _buildAddImagesView() {
    return Container(
      color: MyColors.greyWhite,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Wrap(
        alignment: WrapAlignment.start,
        runAlignment: WrapAlignment.start,
        spacing: 10,
        children: List.generate(widget.model.images!.length, (index) {
          return Container(
            width: 90,
            height: 80,
            margin: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              image: DecorationImage(
                  image: FileImage(widget.model.images![index]),
                  colorFilter:
                      const ColorFilter.mode(Colors.black12, BlendMode.darken),
                  fit: BoxFit.fill),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildInputFields() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        children: [
          Form(
            key: formKey,
            child: LabelTextField(
              margin: const EdgeInsets.symmetric(vertical: 5),
              controller: title,
              action: TextInputAction.next,
              label: " عنوان الإعلان",
              validate: (value) => Validator().validateEmpty(value: value),
            ),
          ),
          BlocBuilder<MapReplyCubit, MapReplyState>(
            bloc: mapReplyCubit,
            builder: (context, state) {
              return Column(
                children: [
                  Row(
                    children: [
                      Checkbox(
                          value: state.showMap,
                          onChanged: (val) => mapReplyCubit.onMapChanged()),
                      const SizedBox(
                        width: 5,
                      ),
                      MyText(
                        title: "اظهار الموقع علي الخريطة",
                        size: 10,
                        color: MyColors.blackOpacity,
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                          value: state.closeReply,
                          onChanged: (val) => mapReplyCubit.onReplyChanged()),
                      const SizedBox(
                        width: 5,
                      ),
                      MyText(
                        title: "اخفاء الرد علي التعليقات",
                        size: 10,
                        color: MyColors.blackOpacity,
                      )
                    ],
                  ),
                ],
              );
            },
          ),
          BlocBuilder<GenericCubit<bool>, GenericState<bool>>(
            bloc: priceCubit,
            builder: (context, state) {
              return Column(
                children: [
                  Row(
                    children: [
                      Checkbox(
                          value: state.data,
                          onChanged: (value) =>
                              priceCubit.onUpdateData(value!)),
                      const SizedBox(width: 5),
                      MyText(
                        title: tr('DoUouNeedPrice'),
                        size: 10,
                        color: MyColors.blackOpacity,
                      )
                    ],
                  ),
                  Offstage(
                    offstage: !state.data,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.swap_vert_circle_outlined,
                              size: 20,
                              color: MyColors.blackOpacity,
                            ),
                            const SizedBox(width: 5),
                            MyText(
                              title: tr("adsPrice"),
                              size: 10,
                              color: MyColors.blackOpacity,
                            )
                          ],
                        ),
                        LabelTextField(
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          controller: price,
                          type: TextInputType.number,
                          label: tr('enterPrice'),
                          action: TextInputAction.next,
                          validate: (value) =>
                              Validator().noValidate(value: value),
                        ),
                      ],
                    ),
                  )
                ],
              );
            },
          ),
          BlocBuilder<GenericCubit<bool>, GenericState<bool>>(
            bloc: phoneCubit,
            builder: (context, state) {
              return Column(
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: state.data,
                        onChanged: (value) => phoneCubit.onUpdateData(value!),
                      ),
                      const SizedBox(width: 5),
                      MyText(
                        title: tr("wantSetPhone"),
                        size: 10,
                        color: MyColors.blackOpacity,
                      )
                    ],
                  ),
                  Offstage(
                    offstage: !state.data,
                    child: LabelTextField(
                      margin: const EdgeInsets.only(bottom: 10),
                      controller: phone,
                      action: TextInputAction.done,
                      type: TextInputType.phone,
                      label: tr("insertPhone"),
                      validate: (value) =>
                          Validator().validateEmpty(value: value),
                    ),
                  )
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildDescInput() {
    return RichTextFiled(
      controller: desc,
      action: TextInputAction.newline,
      type: TextInputType.multiline,
      height: 200,
      max: 15,
      min: 12,
      label: "وصف للاعلان",
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      validate: (String value) {},
    );
  }
}
