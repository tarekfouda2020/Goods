// ignore_for_file: file_names

part of 'ForgetPasswordImports.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<StatefulWidget> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword>  with ForgetPasswordData {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffold,
      body: BlocBuilder<ForgetPasswordCubit,ForgetPasswordState>(
        bloc: forgetPasswordCubit,
        builder: (context,state){
          return IgnorePointer(
            ignoring: state.showLoading,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: ListView(
                physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                padding:const EdgeInsets.symmetric(vertical: 20,horizontal: 15),
                children: <Widget>[

                const  HeaderLogo(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      MyText(
                        title:tr("forgetPassword"),
                        size: 12,
                        color: MyColors.black,
                        alien: TextAlign.center,
                      ),
                      IconButton(
                        icon: Icon(Icons.arrow_forward_ios,size: 25,color: MyColors.primary,),
                        onPressed: ()=> Navigator.of(context).pop(),
                      )
                    ],
                  ),
                  _buildFormInputs(),
                  _buildConfirmButton(state.showLoading),
                ],
              ),
            ),
          );
        },
      ),
    );
  }


  Widget _buildFormInputs(){
    return Container(
      margin:const EdgeInsets.symmetric(vertical: 50),
      child: Form(
        key: formKey,
        child: LabelTextField(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          type: TextInputType.number,
          label: tr("phone"),
          isPassword: false,
          controller: phone,
          action: TextInputAction.done,
          onSubmit: ()=>setForgetPassword(context),
          validate: (value)=> Validator().validatePhone(value: value),
        ),
      ),
    );
  }

  Widget _buildConfirmButton(bool showLoading){
    return Visibility(
      // ignore: sort_child_properties_last
      child: InkWell(
        onTap: ()=>setForgetPassword(context),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 45,
          margin:const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          decoration: BoxDecoration(
            color: MyColors.primary,
            borderRadius: BorderRadius.circular(25),
          ),
          alignment: Alignment.center,
          child: MyText(
            title: tr("send"),
            size: 12,
            color: Colors.white,
          ),
        ),
      ),
      visible: !showLoading,
      replacement: SpinKitDualRing(
        color: MyColors.primary,
        size: 30.0,
      ),
    );
  }

}
