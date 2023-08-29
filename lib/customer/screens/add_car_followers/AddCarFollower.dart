// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:heraggoods/general/constants/Inputs/InkWellTextField.dart';
import 'package:heraggoods/general/constants/MyColors.dart';
import 'package:heraggoods/general/widgets/DefaultAppBar.dart';
import 'package:heraggoods/general/widgets/DefaultButton.dart';
import 'package:heraggoods/general/widgets/MyText.dart';

class AddCarFollower extends StatelessWidget {
  final TextEditingController _city = TextEditingController();
  final TextEditingController _brand = TextEditingController();
  final TextEditingController _model = TextEditingController();
  final TextEditingController _year = TextEditingController();

  AddCarFollower({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        title: "متابعة سيارة جديدة",
        con: context,
      ),
      backgroundColor: MyColors.white,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        children: [
          _buildInputItem(controller: _city, title: "المدينة"),
          _buildInputItem(controller: _brand, title: "الماركة"),
          _buildInputItem(controller: _model, title: "الموديل"),
          _buildInputItem(controller: _year, title: "سنة الصنع"),
          DefaultButton(title: "استمرار", onTap: () {})
        ],
      ),
    );
  }

  Widget _buildInputItem(
      {required TextEditingController controller, required String title}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: MyText(
            title: title,
            size: 10,
            color: MyColors.black,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        InkWellTextField(
          controller: controller,
          label: "اختر $title",
          onTab: () {},
          dropDown: true,
          icon: Icon(
            Icons.keyboard_arrow_down_outlined,
            size: 25,
            color: MyColors.primary,
          ),
        )
      ],
    );
  }
}
