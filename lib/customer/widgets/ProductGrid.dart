// ignore_for_file: implementation_imports, file_names

import 'package:auto_route/auto_route.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

import '../../general/constants/MyColors.dart';
import '../../general/utilities/routers/RouterImports.gr.dart';
import '../../general/widgets/CachedImage.dart';
import '../../general/widgets/MyText.dart';
import '../models/AdsModel.dart';

class ProductGrid extends StatelessWidget {
  final int index;
  final AdsModel model;

  const ProductGrid({super.key, required this.index, required this.model});

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
            BoxShadow(color: MyColors.greyWhite, spreadRadius: 1, blurRadius: 1)
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width - 50,
              height: 160,
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return CachedImage(
                    url: model.allImg[index],
                    fit: BoxFit.contain,
                    width: MediaQuery.of(context).size.width - 50,
                    height: 120,
                    colorFilter: const ColorFilter.mode(
                        Colors.black12, BlendMode.darken),
                    alignment: Alignment.topLeft,
                    borderRadius: BorderRadius.circular(5),
                    child: Icon(
                      model.checkWishList
                          ? Icons.favorite
                          : Icons.favorite_border,
                      size: 25,
                      color: MyColors.primary,
                    ),
                  );
                },
                autoplay: false,
                itemCount: model.allImg.length,
                scrollDirection: Axis.horizontal,
                pagination:
                    const SwiperPagination(alignment: Alignment.bottomCenter),
                control: const SwiperControl(),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: MediaQuery.of(context).size.width - 25,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      MyText(
                        title: model.title,
                        size: 10,
                        color: MyColors.greenColor,
                      ),
                      const Spacer(),
                      Visibility(
                        visible: model.checkRate,
                        child: Icon(
                          Icons.thumb_up_off_alt,
                          size: 20,
                          color: MyColors.primary,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Visibility(
                        visible: model.countComment > 0,
                        child: Row(
                          children: [
                            Icon(
                              Icons.comment_outlined,
                              size: 20,
                              color: MyColors.grey,
                            ),
                            MyText(
                              title: "${model.countComment}",
                              size: 8,
                              color: MyColors.blackOpacity,
                            ),
                          ],
                        ),
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
                      MyText(
                        title: model.userName!,
                        size: 8,
                        color: MyColors.blackOpacity,
                      ),
                      const Spacer(),
                      Icon(
                        Icons.watch_later_outlined,
                        size: 20,
                        color: MyColors.grey,
                      ),
                      MyText(
                        title: model.date,
                        size: 8,
                        color: MyColors.blackOpacity,
                      ),
                      const Spacer(),
                      Icon(
                        Icons.location_pin,
                        size: 20,
                        color: MyColors.grey,
                      ),
                      MyText(
                        title: model.location ?? "",
                        size: 8,
                        color: MyColors.blackOpacity,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
