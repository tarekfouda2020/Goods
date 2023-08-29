// ignore_for_file: file_names

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../general/blocs/user_cubit/user_cubit.dart';
import '../../general/constants/MyColors.dart';
import '../../general/utilities/routers/RouterImports.gr.dart';
import '../../general/widgets/CachedImage.dart';
import '../../general/widgets/MyText.dart';
import '../models/AdsModel.dart';

class ProductRow extends StatelessWidget {
  final int index;
  final AdsModel model;
  final Color color;
  final String adOwnerImg;

  const ProductRow({
    super.key,
    required this.index,
    required this.model,
    required this.adOwnerImg,
    this.color = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => AutoRouter.of(context)
          .push(ProductDetailsRoute(model: model, info: model.info!)),
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
            color: index.isEven ? Colors.white60 : Colors.white,
            boxShadow: [
              BoxShadow(
                  color: MyColors.greyWhite, spreadRadius: 1, blurRadius: 1)
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width - 150,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText(
                    title: model.title,
                    size: 10,
                    color: MyColors.greenColor,
                  ),
                 const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Visibility(
                        visible: model.checkRate,
                        child: Icon(
                          Icons.thumb_up_off_alt,
                          size: 20,
                          color: MyColors.primary,
                        ),
                      ),
                    const  SizedBox(
                        width: 5,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.comment_outlined,
                            size: 20,
                            color:  MyColors.grey,
                          ),
                          MyText(
                              title: "${model.countComment}",
                              size: 8,
                              color:   MyColors.blackOpacity),
                        ],
                      ),
                    const  Spacer(),
                      Icon(
                        Icons.watch_later_outlined,
                        size: 17,
                        color: MyColors.grey,
                      ),
                    const  SizedBox(
                        width: 2,
                      ),
                      MyText(
                        title: model.date,
                        size: 7,
                        color:  MyColors.blackOpacity,
                      ),
                    ],
                  ),
                 const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 13,
                        backgroundColor: MyColors.primary,
                        child: Text(model.userName![0],textAlign:TextAlign.center,style: const TextStyle(
                          fontSize: 12
                        ),),
                      ),
                      SizedBox(width: 5,),
                      // Icon(
                      //   Icons.person_outline,
                      //   size: 20,
                      //   color:  MyColors.grey,
                      // ),
                      Expanded(
                        child: MyText(
                          title: model.userName ?? "",
                          size: 8,
                          color: MyColors.blackOpacity, 
                        ),
                      ),
                    const  Spacer(),
                      Icon(
                        Icons.location_pin,
                        size: 20,
                        color:  MyColors.grey,
                      ),
                     const SizedBox(
                        width: 2,
                      ),
                      MyText(
                        title: model.locationPlus ?? "",
                        size: 8,
                        color:  MyColors.blackOpacity,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            CachedImage(
              url: model.img,
              width: 120,
              height: 100,
              colorFilter:const ColorFilter.mode(Colors.black12, BlendMode.darken),
              alignment: Alignment.topLeft,
              borderRadius: BorderRadius.circular(5),
              child: Visibility(
                visible: model.userName !=
                    context.read<UserCubit>().state.model.userName,
                child: Icon(
                  model.checkWishList ? Icons.favorite : Icons.favorite_border,
                  size: 25,
                  color: color,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
