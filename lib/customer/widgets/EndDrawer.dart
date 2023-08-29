// ignore_for_file: file_names, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../general/constants/ModaLs/LoadingDialog.dart';
import '../../general/constants/MyColors.dart';
import '../../general/utilities/moor_db/db.dart';
import '../../general/widgets/CachedImage.dart';
import '../../general/widgets/MyText.dart';
import '../models/Dtos/CategoryChildModel.dart';
import '../screens/home/homeTabs/home_main/HomeMainImports.dart';

class EndDrawer extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffold;

  const EndDrawer({super.key, required this.scaffold});

  void setSelectCat(Category model) async {
    HomeMainData().applyListener = false;
    var data = await scaffold.currentContext!
        .read<MyDatabase>()
        .selectParentCatsAsync();
    var parent = data.where((element) => element.id == model.parentId).first;
    HomeMainData().currentCat = model.id ?? 0;
    HomeMainData().catTabCubit.onUpdateCatsTab(model.id ?? 0);
    HomeMainData().catViewCubit.onUpdateCatRows([]);
    List<Category> children = await scaffold.currentContext!
        .read<MyDatabase>()
        .selectChildrenCatsAsync(model.id ?? 0);
    if (children.isNotEmpty) {
      HomeMainData().catViewCubit.onAddCatRow(
          CategoryChildModel(cats: children, parentId: model.id ?? 0));
    }
    HomeMainData().tabController.animateTo(data.indexOf(parent));
    HomeMainData().currentIndex = data.indexOf(parent);
    HomeMainData().pagingController.refresh();
    Navigator.of(scaffold.currentContext!).pop();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Container(
          width: MediaQuery.of(context).size.width * .8,
          height: MediaQuery.of(context).size.height,
          color: MyColors.greyWhite,
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: StreamBuilder<List<int>>(
              stream: context.watch<MyDatabase>().selectSideCats(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: List.generate(snapshot.data!.length, (index) {
                      return StreamBuilder<List<Category>>(
                          stream: context
                              .watch<MyDatabase>()
                              .selectSlideChildrenCatsNotNull(
                                  snapshot.data![index]),
                          builder: (context, snapshotLength) {
                            if (snapshotLength.hasData) {
                              if (snapshotLength.data!.isNotEmpty) {
                                print(
                                    "selectSlideChildrenCatsNotNull length ====>${snapshotLength.data!.length}");
                                return Column(
                                  children: [
                                    StreamBuilder<Category>(
                                      stream: context
                                          .watch<MyDatabase>()
                                          .selectCatData(snapshot.data![index]),
                                      builder: (context, snapshot) {
                                        if (snapshot.hasData) {
                                          return _buildHeaderTitle(
                                              snapshot.data!);
                                        } else {
                                          return const SizedBox();
                                        }
                                      },
                                    ),
                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 20),
                                      child: Wrap(
                                        alignment: WrapAlignment.center,
                                        runSpacing: 15,
                                        spacing: 10,
                                        runAlignment: WrapAlignment.start,
                                        children: List.generate(
                                            snapshotLength.data!.length,
                                            (index) {
                                          return _buildBrandItem(
                                              model:
                                                  snapshotLength.data![index]);
                                        }),
                                      ),
                                    ),
                                  ],
                                );
                              } else {
                                return Container();
                              }
                            } else {
                              return Container(
                                height: MediaQuery.of(context).size.height*0.8,
                                alignment: Alignment.center,
                                child: SpinKitFadingCircle(
                                  color: MyColors.primary,
                                  size: 30.0,
                                ),
                              );
                            }
                          });
                    }),
                  );
                } else {
                  return Center(
                    child: LoadingDialog.showLoadingView(),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBrandItem({required Category model}) {
    return InkWell(
      onTap: () => setSelectCat(model),
      child: Container(
        width: MediaQuery.of(scaffold.currentContext!).size.width * .2,
        height: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: model.img!.toLowerCase().contains(".svg")
            ? _buildSvgIcon(model.img ?? "")
            : _buildImageView(model.img ?? ""),
      ),
    );
  }

  Widget _buildSvgIcon(String icon) {
    return SvgPicture.network(icon,
        semanticsLabel: '',
        width: MediaQuery.of(scaffold.currentContext!).size.width * .2,
        height: 80,
        placeholderBuilder: (BuildContext context) => SpinKitFadingCircle(
              color: MyColors.primary,
              size: 30.0,
            ));
  }

  Widget _buildImageView(String icon) {
    return CachedImage(
      url: icon,
      width: MediaQuery.of(scaffold.currentContext!).size.width * .2,
      height: 80,
      fit: BoxFit.fill,
      borderRadius: BorderRadius.circular(10),
    );
  }

  Widget _buildHeaderTitle(Category category) {
    return Container(
      height: 45,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(color: MyColors.white, boxShadow: [
        BoxShadow(
          color: MyColors.greyWhite,
          spreadRadius: 1.2,
        )
      ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              child: MyText(
            title: category.name,
            size: 12,
            color: MyColors.black,
          )),
        ],
      ),
    );
  }
}
