// ignore_for_file: prefer_const_constructors

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:develocity/business_logic/admin_news_cubit/admin_news_cubit.dart';
import 'package:develocity/constants/core/colors.dart';
import 'package:develocity/constants/core/const.dart';
import 'package:develocity/presentation/admins/screens/drawer_screens/news/update_news_admin_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../widgets/drawer_widget.dart';

class AdminNewsScreen extends StatefulWidget {
  const AdminNewsScreen({Key? key}) : super(key: key);

  @override
  State<AdminNewsScreen> createState() => _AdminNewsScreenState();
}

class _AdminNewsScreenState extends State<AdminNewsScreen> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: csutomAppBarInDrawers(
          image: 'assets/images/arrow.png',
          image2: 'assets/images/search.png',
          text: 'News',
          onTap: () {
            Navigator.pop(context);
          },
          onTap1: () {}),
      body: BlocConsumer<AdminNewsCubit, AdminNewsState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 13,
            ),
            child: ConditionalBuilder(
              condition: state is! GetNewsLoadingState ||
                  state is! GetAdminNewsTypeLoadingState,
              builder: (context) => Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'All',
                        style: headingStyle.copyWith(
                            fontFamily: 'SF Pro Display',
                            color: const Color(0xff696CFF),
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        width: w * 0.05,
                      ),
                      Text(
                        'Recently added',
                        style: headingStyle.copyWith(
                            fontFamily: 'SF Pro Display',
                            color: const Color(0xff435971).withOpacity(0.5),
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                      const Spacer(),
                      Image.asset(
                        'assets/images/filter.png',
                        width: w * 0.1,
                        height: h * 0.07,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: h * 0.01,
                  ),
                  ConditionalBuilder(
                    condition: state is! GetNewsLoadingState ||
                        state is! GetAdminNewsTypeLoadingState,
                    builder: (context) => SizedBox(
                      height: h * .73,
                      child: ListView.separated(
                          shrinkWrap: true,
                          primary: true,
                          itemBuilder: (context, index) => buildComplainCard(
                              h: h,
                              w: w,
                              id: AdminNewsCubit.get(context)
                                  .getAdminNewsModel
                                  .data![index]
                                  .id
                                  .toString(),
                              typeId: AdminNewsCubit.get(context)
                                  .getAdminNewsTypeModel
                                  .data![index]
                                  .id
                                  .toString(),
                              branchName: AdminNewsCubit.get(context)
                                  .getAdminNewsModel
                                  .data![index]
                                  .branch!
                                  .name
                                  .toString(),
                              newsType: AdminNewsCubit.get(context)
                                  .getAdminNewsTypeModel
                                  .data![index]
                                  .title
                                  .toString(),
                              desc: AdminNewsCubit.get(context)
                                  .getAdminNewsModel
                                  .data![index]
                                  .desc
                                  .toString(),
                              img: AdminNewsCubit.get(context)
                                  .getAdminNewsModel
                                  .data![index]
                                  .img
                                  .toString(),
                              title: AdminNewsCubit.get(context)
                                  .getAdminNewsModel
                                  .data![index]
                                  .title
                                  .toString()),
                          separatorBuilder: (context, index) => SizedBox(
                                height: h * 0.013,
                              ),
                          itemCount: AdminNewsCubit.get(context)
                              .getAdminNewsModel
                              .data!
                              .length),
                    ),
                    fallback: (context) =>
                        Center(child: CircularProgressIndicator()),
                  )
                ],
              ),
              fallback: (context) => Center(child: CircularProgressIndicator()),
            ),
          );
        },
      ),
    );
  }

  Widget buildComplainCard({
    required double h,
    required double w,
    required String title,
    required String desc,
    required String branchName,
    required String newsType,
    required String img,
    required String id,
    required String typeId,
  }) =>
      Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
        ),
        margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
                offset: Offset(0, 2),
                // ignore: use_full_hex_values_for_flutter_colors
                color: Color(0xff26000000),
                spreadRadius: 1,
                blurRadius: 2)
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: h * 0.015,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Center(
                  child: SizedBox(
                    width: w * 0.23,
                    height: h * 0.09,
                    child: customCachedNetworkImage(
                        url: img, context: context, fit: BoxFit.contain),
                  ),
                ),
                buildEditAndDeleteRowCard(
                    id: id,
                    desc: desc,
                    title: title,
                    titleType: newsType,
                    typeId: typeId),
              ],
            ),
            SizedBox(
              height: h * 0.015,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('News Type : ',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(fontSize: 14)),
                SizedBox(
                  width: w * 0.67,
                  child: Text(newsType,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(fontSize: 16, color: MyColors.mainColor)),
                ),
              ],
            ),
            SizedBox(
              height: h * 0.015,
            ),
            Row(
              children: [
                Text('Title : ',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(fontSize: 14)),
                Text(title,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(fontSize: 16, color: MyColors.mainColor)),
              ],
            ),
            SizedBox(
              height: h * 0.015,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Descripion : ',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(fontSize: 14)),
                SizedBox(
                  width: w * 0.67,
                  child: Text(desc,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(fontSize: 16, color: MyColors.mainColor)),
                ),
              ],
            ),
            SizedBox(
              height: h * 0.015,
            ),
            Row(
              children: [
                Text('Branch Name: ',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(fontSize: 14)),
                Text(branchName,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(fontSize: 16, color: MyColors.mainColor)),
              ],
            ),
            SizedBox(
              height: h * 0.015,
            ),
          ],
        ),
      );
}

Widget buildEditAndDeleteRowCard({
  required String id,
  required String typeId,
  required String desc,
  required String title,
  required String titleType,
}) =>
    BlocConsumer<AdminNewsCubit, AdminNewsState>(
      listener: (context, state) {
        if (state is DeleteAdminNewsTypeSuccessState ||
            state is DeleteNewsSuccessState) {
          AdminNewsCubit.get(context).getNews();
          // AdminNewsCubit.get(context).getAdminNewsType();
        }
      },
      builder: (context, state) {
        return Row(
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => UpdateNewsScreeen(
                              typeId: typeId,
                              id: id,
                              desc: desc,
                              title: title,
                              titleType: titleType,
                            )));
              },
              child: Container(
                margin: EdgeInsets.only(left: 10),
                width: 40,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(5),
                        topLeft: Radius.circular(5))),
                child: Center(
                  child: Image.asset(
                    'assets/images/edit-line.png',
                    width: 18,
                    height: 25,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                // AdminNewsCubit.get(context).deleteAdminNewsType(typeId);
                AdminNewsCubit.get(context).deleteNews(id: id);
              },
              child: Container(
                width: 40,
                decoration: BoxDecoration(
                    color: Color(0xffFF3E1D).withOpacity(0.3),
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(5),
                        topRight: Radius.circular(5))),
                child: Center(
                  child: Image.asset(
                    'assets/images/delete-out.png',
                    width: 18,
                    height: 25,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
