// ignore_for_file: file_names, library_private_types_in_public_api

part of 'ChangePasswordImports.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword>
    with ChangePasswordData {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(title: "تغيير رمز المرور", con: context),
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 30),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  LabelTextField(
                    controller: oldPassword,
                    label: "رمز المرور القديمة",
                    isPassword: true,
                    margin:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    action: TextInputAction.next,
                    validate: (value) =>
                        Validator().validateEmpty(value: value),
                    type: TextInputType.text,
                  ),
                  LabelTextField(
                    controller: newPassword,
                    label: "رمز المرور الجديدة",
                    isPassword: true,
                    margin:const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    action: TextInputAction.next,
                    validate: (value) =>
                        Validator().validatePassword(value: value),
                    type: TextInputType.text,
                  ),
                  LabelTextField(
                    controller: confirm,
                    label: "تاكيد رمز المرور",
                    isPassword: true,
                    margin:const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    action: TextInputAction.done,
                    validate: (value) => Validator().validatePasswordConfirm(
                        confirm: value, pass: newPassword.text),
                    type: TextInputType.text,
                    onSubmit: () => setChangePassword(context),
                  ),
                ],
              ),
            ),
          ),
          DefaultButton(
            onTap: () => setChangePassword(context),
            title: "حفظ التعديلات",
            margin:const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          ),
        ],
      ),
    );
  }
}
