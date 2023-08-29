// ignore_for_file: file_names

part of 'OfferSwearingImports.dart';

class OfferSwearing extends StatelessWidget with OfferSwearingData {
  final OffersHeaderModel model;
  OfferSwearing({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        con: context,
        title: "اتفاقية العمولة",
      ),
      backgroundColor: MyColors.white,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            color: MyColors.greyWhite,
            child: Column(
              children: [
                MyText(
                  title: " بِسْمِ اللَّـهِ الرَّحْمَـٰنِ الرَّحِيمِ",
                  size: 12,
                  color: MyColors.black,
                ),
                const SizedBox(
                  height: 10,
                ),
                MyText(
                  title:
                      "﴿ وَأَوْفُوا بِعَهْدِ اللَّهِ إِذَا عَاهَدْتُمْ وَلَا تَنْقُضُوا الْأَيْمَانَ بَعْدَ تَوْكِيدِهَا وَقَدْ جَعَلْتُمُ اللَّهَ عَلَيْكُمْ كَفِيلًا إِنَّ اللَّهَ يَعْلَمُ مَا تَفْعَلُونَ ﴾",
                  size: 11,
                  color: MyColors.black,
                  alien: TextAlign.center,
                ),
                const SizedBox(
                  height: 10,
                ),
                MyText(
                  title:
                  "﴿ أتعهد بدفع عمولة الموقع في حال البيع من خلال الموقع أو بسببه في مدة اقصاها 24 ساعة من اتمام البيع ﴾",
                  size: 11,
                  color: MyColors.black,
                  alien: TextAlign.center,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlocBuilder<SwearingCubit, SwearingState>(
                bloc: swearingCubit,
                builder: (context, state) {
                  return Checkbox(
                      value: state.accepted,
                      onChanged: (value) => setChangeAcceptSate(value!));
                },
              ),
              Container(
                width: MediaQuery.of(context).size.width - 50,
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: MyText(
                  title:
                      "يجب الموافقة علي هذا التعهد حتي يمكنك المتابعة واضافة الاعلان وهذه احد الشروط الاساسية للتطبيق .",
                  size: 10,
                  color: MyColors.blackOpacity,
                ),
              )
            ],
          ),
          const Spacer(),
          DefaultButton(
              margin: const EdgeInsets.all(20),
              title: "استمرار",
              onTap: () => navigateToAddOfferImages(context, model)),
        ],
      ),
    );
  }
}
