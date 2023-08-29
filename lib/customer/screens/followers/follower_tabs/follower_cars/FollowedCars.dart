// ignore_for_file: file_names

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:heraggoods/general/constants/MyColors.dart';
import 'package:heraggoods/general/utilities/routers/RouterImports.gr.dart';
import 'package:heraggoods/general/widgets/DefaultButton.dart';
import 'package:heraggoods/general/widgets/MyText.dart';

class FollowedCars extends StatelessWidget {
  const FollowedCars({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
            child: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          itemCount: 4,
          itemBuilder: (context, index) {
            return _buildCarItem(index, context);
          },
        )),
        DefaultButton(
            title: "متابعة السيارات الجديدة",
            onTap: () => AutoRouter.of(context).push(AddCarFollowerRoute()))
      ],
    );
  }

  Widget _buildCarItem(int index, BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Slidable(
          startActionPane: ActionPane(
            motion: const ScrollMotion(),
            children: [
              SlidableAction(
                label: tr("remove"),
                backgroundColor: Colors.red,
                icon: Icons.delete,
                onPressed: (context) {},
              ),
            ],
          ),
          child: InkWell(
            onTap: () => AutoRouter.of(context).push(AddCarFollowerRoute()),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                        color: MyColors.greyWhite,
                        blurRadius: 1.2,
                        spreadRadius: 1.2)
                  ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyText(
                    title: "كورلا",
                    size: 11,
                    color: MyColors.blackOpacity,
                  ),
                  MyText(
                    title: "2020",
                    size: 11,
                    color: MyColors.blackOpacity,
                  ),
                  MyText(
                    title: "الرياض",
                    size: 11,
                    color: MyColors.blackOpacity,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
