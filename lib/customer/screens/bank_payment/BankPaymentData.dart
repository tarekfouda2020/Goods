// ignore_for_file: file_names, unnecessary_null_comparison, use_build_context_synchronously

part of 'BankPaymentImports.dart';

class BankPaymentData {
  final GlobalKey<FormState> formKey = GlobalKey();

  final TextEditingController name = TextEditingController();
  final TextEditingController number = TextEditingController();
  final TextEditingController adNumber = TextEditingController();
  final TextEditingController ipanNumber = TextEditingController();
  final TextEditingController notes = TextEditingController();
  final TextEditingController price = TextEditingController();
  final TextEditingController img = TextEditingController();

  final PayCubit payCubit = PayCubit();

  String? bankId;

  setSelectBank(BankModel model) {
    if (model != null) {
      bankId = model.id.toString();
    }
  }

  void setImage() async {
    var image = await Utils.getImage();
    if (image != null) payCubit.onUpdatePayImage(image);
  }

  void addPayment(BuildContext context) async {
    if (payCubit.state.image == null) {
      LoadingDialog.showSimpleToast("اضف صورة الايصال");
      return;
    }
    if (formKey.currentState!.validate()) {
      AddPayModel model = AddPayModel(
          lang: context.read<LangBloc>().state.lang,
          image: payCubit.state.image,
          price: price.text,
          accountNumber: number.text,
          adsNumber: adNumber.text,
          fKBank: bankId,
          notes: notes.text,
          ipan: ipanNumber.text,
          transferName: name.text,
          type: "1");
      var result = await CustomerRepository(context).addPayment(model);
      if (result) {
        payCubit.onUpdatePayImage(File(""));
        img.text = price.text = adNumber.text =
            name.text = number.text = notes.text = ipanNumber.text = "";
        AutoRouter.of(context).pop();
      }
    }
  }
}
