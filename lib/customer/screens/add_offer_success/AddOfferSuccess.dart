// ignore_for_file: file_names, use_build_context_synchronously

part of 'OfferSuccessImports.dart';

class AddOfferSuccess extends StatelessWidget {
  const AddOfferSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: MyColors.primary,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          const Spacer(),
          const Image(
            image: AssetImage(Res.success),
            width: 150,
            height: 150,
          ),
          const SizedBox(
            height: 15,
          ),
          MyText(
            title: "تم اضافة الإعلان بنجاح",
            size: 12,
            color: MyColors.white,
          ),
          const Spacer(),
          DefaultButton(
              margin: const EdgeInsets.all(20),
              title: "الرجوع للرئيسية",
              borderColor: MyColors.black,
              onTap: () async {
                HomeMainData().pagingController.refresh();
                context
                    .read<LocationCubit>()
                    .onLocationUpdated(const LocationModel("0", "0", ""));
                int parentCount =
                    (await context.read<MyDatabase>().selectParentCatsAsync())
                        .length;
                AutoRouter.of(context)
                    .replaceAll([HomeRoute(parentCount: parentCount)]);
              }),
        ],
      ),
    );
  }
}
