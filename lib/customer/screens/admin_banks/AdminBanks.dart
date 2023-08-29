// ignore_for_file: library_private_types_in_public_api, file_names

part of 'AdminBanksImports.dart';

class AdminBanks extends StatefulWidget {
  const AdminBanks({super.key});

  @override
  _AdminBanksState createState() => _AdminBanksState();
}

class _AdminBanksState extends State<AdminBanks> {
  final BanksCubit banksCubit = BanksCubit();
  @override
  void initState() {
    banksCubit.fetchData(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(title: tr('bankAccounts'), con: context),
      body: BlocBuilder<BanksCubit, BanksState>(
        bloc: banksCubit,
        builder: (_, state) {
          if (state is BanksUpdateState) {
            return ListView.builder(
              padding:const EdgeInsets.symmetric(horizontal: 15),
              physics:const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              itemCount: state.banks.length,
              itemBuilder: (_, index) {
                return _buildBankView(state.banks[index]);
              },
            );
          } else {
            return Center(
              child: LoadingDialog.showLoadingView(),
            );
          }
        },
      ),
    );
  }

  Widget _buildBankView(BankModel model) {
    return AnimationContainer(
      scale: true,
      duration:const Duration(milliseconds: 300),
      index: 0,
      child: Container(
        margin:const EdgeInsets.only(top: 10),
        padding:const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: [BoxShadow(color: MyColors.greyWhite, spreadRadius: 1)]),
        child: Row(
          children: [
            CachedImage(
              url: model.img,
              width: 80,
              height: 90,
              borderRadius: BorderRadius.circular(5),
            ),
           const SizedBox(width: 5),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText(
                  title: model.beneficiaryName,
                  size: 12,
                  color: MyColors.primary,
                ),
                Row(
                  children: [
                    MyText(
                      title: "اسم البنك : ",
                      size: 10,
                      color: MyColors.blackOpacity,
                    ),
                    MyText(
                      title: model.name,
                      size: 10,
                      color: MyColors.black,
                    ),
                  ],
                ),
                Row(
                  children: [
                    MyText(
                      title: "رقم الحساب : ",
                      size: 10,
                      color: MyColors.blackOpacity,
                    ),
                    MyText(
                      title: model.accountNumber,
                      size: 10,
                      color: MyColors.black,
                    ),
                  ],
                ),
                Row(
                  children: [
                    MyText(
                      title: "رقم الايبان : ",
                      size: 10,
                      color: MyColors.blackOpacity,
                    ),
                    MyText(
                      title: model.ibandNumber,
                      size: 10,
                      color: MyColors.black,
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
