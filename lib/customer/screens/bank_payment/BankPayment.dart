// ignore_for_file: library_private_types_in_public_api, unnecessary_null_comparison, file_names

part of 'BankPaymentImports.dart';

class BankPayment extends StatefulWidget {
  const BankPayment({super.key});

  @override
  _BankPaymentState createState() => _BankPaymentState();
}

class _BankPaymentState extends State<BankPayment> with BankPaymentData {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(title: "دفع العمولة", con: context),
      body: ListView(
        physics:const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        padding:const EdgeInsets.symmetric(horizontal: 20),
        children: [
          _buildFormInputs(),
          DefaultButton(
            margin:const EdgeInsets.symmetric(vertical: 30,horizontal: 15),
            title: "ارسال",
            onTap: ()=>addPayment(context),
          )
        ],
      ),
    );
  }

  Widget _buildFormInputs(){
    return Form(
      key: formKey,
      child: Column(
        children: [
          BlocConsumer<PayCubit,PayState>(
              bloc: payCubit,
              listener: (_,state){
                if(state.image!=null){
                  img.text=state.image!.path.split("/").last;
                }
              },
              builder: (_,state){
                return InkWellTextField(
                  controller: img,
                  label: "صورة الايصال",
                  margin:const EdgeInsets.symmetric(vertical: 10),
                  icon: Icon(Icons.image,size: 25,color: MyColors.primary),
                  onTab: setImage,
                );
              }
          ),
          // LabelTextField(
          //   controller: bank,
          //   margin: EdgeInsets.symmetric(vertical: 10),
          //   label: "اسم البنك",
          //   type: TextInputType.text,
          //   validate: (value)=>Validator().validateEmpty(value: value),
          //   action: TextInputAction.next,
          // ),
          DropdownTextField<BankModel>(
            label: "اسم البنك",
            margin:const EdgeInsets.symmetric(vertical: 10),
            onChange: setSelectBank,
            finData: (filter)async=> await CustomerRepository(context).getBanks(),
            validate: (value)=>Validator().validateDropDown<BankModel>(model: value),
          ),
          LabelTextField(
            controller: name,
            margin:const EdgeInsets.symmetric(vertical: 10),
            label: "اسم صاحب الحساب",
            type: TextInputType.text,
            validate: (value)=>Validator().validateEmpty(value: value),
            action: TextInputAction.next,
          ),
          LabelTextField(
            controller: number,
            margin:const EdgeInsets.symmetric(vertical: 10),
            label: "رقم الحساب",
            type: TextInputType.number,
            validate: (value)=>Validator().validateEmpty(value: value),
            action: TextInputAction.next,
          ),
          LabelTextField(
            controller: ipanNumber,
            margin:const EdgeInsets.symmetric(vertical: 10),
            label: "رقم الايبان",
            type: TextInputType.number,
            validate: (value)=>Validator().validateEmpty(value: value),
            action: TextInputAction.next,
          ),
          // LabelTextField(
          //   controller: adNumber,
          //   margin:const EdgeInsets.symmetric(vertical: 10),
          //   label: "رقم الاعلان",
          //   type: TextInputType.number,
          //   validate: (value)=>Validator().validateEmpty(value: value),
          //   action: TextInputAction.next,
          // ),
          LabelTextField(
            controller: price,
            margin:const EdgeInsets.symmetric(vertical: 10),
            label: "المبلغ المحول",
            type: TextInputType.number,
            validate: (value)=>Validator().validateEmpty(value: value),
            action: TextInputAction.next,
          ),
          RichTextFiled(
            controller: notes,
            margin:const EdgeInsets.symmetric(vertical: 10),
            label: "اضف ملاحظاتك",
            type: TextInputType.text,
            validate: (value)=>Validator().noValidate(value: value),
            action: TextInputAction.done,
            height: 100,
            min: 6,
            max: 8,
            submit: (value)=>addPayment(context),
          ),
        ],
      ),
    );
  }

}
