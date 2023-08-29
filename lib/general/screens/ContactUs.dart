// ignore_for_file: file_names, library_private_types_in_public_api

import 'package:heraggoods/general/constants/Inputs/LabelTextField.dart';
import 'package:heraggoods/general/constants/Inputs/RichTextFiled.dart';
import 'package:heraggoods/general/constants/MyColors.dart';
import 'package:heraggoods/general/resources/GeneralRepository.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:heraggoods/general/utilities/validator/Validator.dart';
import 'package:heraggoods/general/widgets/DefaultAppBar.dart';
import 'package:heraggoods/general/widgets/DefaultButton.dart';
import 'package:heraggoods/res.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({super.key});

  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  final GlobalKey<ScaffoldState> _scaffold = GlobalKey();
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _mail = TextEditingController();
  final TextEditingController _msg = TextEditingController();
  GeneralRepository? _repository;

  @override
  void initState() {
    super.initState();
  }

  _sendMessage() {
    if (_formKey.currentState!.validate()) {
      _repository!.sendMessage(_name.text, _mail.text, _msg.text).then((value) {
        _name.text = "";
        _mail.text = "";
        _msg.text = "";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        title: tr("contactUs"), //"تواصل معنا",
        con: context,
        leading: IconButton(
          icon: Icon(
            Icons.menu_rounded,
            size: 25,
            color: MyColors.secondary,
          ),
          onPressed: () {},
        ),
      ),
      backgroundColor: MyColors.primary,
      key: _scaffold,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        margin:const EdgeInsets.only(top: 15),
        padding:const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
            color: MyColors.greyWhite,
            borderRadius:const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            )),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: 100,
                height: 100,
                margin:const EdgeInsets.symmetric(vertical: 15),
                decoration: BoxDecoration(
                    image:const DecorationImage(
                        image: AssetImage(Res.logo), fit: BoxFit.fill),
                    shape: BoxShape.circle,
                    border: Border.all(color: MyColors.primary, width: 1)),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      LabelTextField(
                        label: tr("name"), //"الأسم",
                        type: TextInputType.text,
                        controller: _name,
                        validate: (value) =>
                            Validator().validateEmpty(value: value),
                      ),
                      LabelTextField(
                        label: tr("mail"), //"البريد",
                        type: TextInputType.emailAddress,
                        controller: _mail,
                        validate: (value) =>
                            Validator().validateEmail(value: value),
                      ),
                      RichTextFiled(
                        label: tr("message"), //"الرسالة",
                        type: TextInputType.emailAddress,
                        height: 100,
                        max: 8,
                        min: 6,
                        controller: _msg,
                        validate: (value) =>
                            Validator().validateEmpty(value: value),
                      ),

                      DefaultButton(
                        title: tr("send"), //"ارسال",
                        onTap: _sendMessage,
                        margin:
                          const  EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                      ),

                      // Container(
                      //   margin: EdgeInsets.only(bottom: 30,),
                      //   child: Wrap(
                      //     spacing: 25,
                      //     runSpacing: 15,
                      //     alignment: WrapAlignment.center,
                      //     children: [
                      //       InkWell(
                      //         onTap: ()=>Utils.launchURL(url: setting.instgram,scaffold: _scaffold),
                      //         child: Icon(FontAwesomeIcons.instagram,size: 30,color: MyColors.grey,),
                      //       ),
                      //       InkWell(
                      //         onTap: ()=>Utils.launchURL(url: setting.facebook,scaffold: _scaffold),
                      //         child: Icon(FontAwesomeIcons.facebookF,size: 30,color: MyColors.grey,),
                      //       ),
                      //       InkWell(
                      //         onTap: ()=>Utils.launchURL(url: setting.twitter,scaffold: _scaffold),
                      //         child: Icon(FontAwesomeIcons.twitter,size: 30,color: MyColors.grey,),
                      //       ),
                      //     ],
                      //   ),
                      // )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
