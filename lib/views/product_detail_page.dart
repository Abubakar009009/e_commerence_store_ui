// ignore_for_file: unused_local_variable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerence_store_ui/models/products_model.dart';
import 'package:e_commerence_store_ui/providers/product_details_provider.dart';
import 'package:e_commerence_store_ui/utils/app_colors.dart';
import 'package:e_commerence_store_ui/utils/app_constants.dart';
import 'package:e_commerence_store_ui/utils/app_strings.dart';
import 'package:e_commerence_store_ui/utils/media_query.dart';
import 'package:e_commerence_store_ui/views/reviews_page.dart';
import 'package:e_commerence_store_ui/widgets/back_custom.dart';
import 'package:e_commerence_store_ui/widgets/bag_custom.dart';
import 'package:e_commerence_store_ui/widgets/custom_reviewbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';
import 'package:shimmer/shimmer.dart';

import '../services/add_to_cart.dart';
import '../utils/common_functions.dart';
import '../widgets/custom_bottom_buttons.dart';

class ProductDeatilsPage extends StatefulWidget {
  final ProductsModel object;
  const ProductDeatilsPage({required this.object, super.key});

  @override
  State<ProductDeatilsPage> createState() => _ProductDeatilsPageState();
}

class _ProductDeatilsPageState extends State<ProductDeatilsPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context
        .read<ProductDetailsProvider>()
        .setImage(widget.object.imageLink[0], 0);
    context.read<ProductDetailsProvider>().setSize(0);
  }

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final User? currentUser = _auth.currentUser;
    return Scaffold(
      body: Column(children: [
        Expanded(
          child: Container(
            height: GetScreenSize.getScreenWidth(context) * 3,
            width: GetScreenSize.getScreenWidth(context) * 1,
            child: Stack(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: InteractiveViewer(
                    boundaryMargin: const EdgeInsets.all(5),
                    child: CachedNetworkImage(
                      imageUrl:
                          context.watch<ProductDetailsProvider>().getImage,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: Container(
                          color: Colors
                              .white, // You can set any background color here
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: GetScreenSize.getScreenWidth(context) * 0.17,
                  child: const BackCustom(),
                ),
                Positioned(
                    top: GetScreenSize.getScreenWidth(context) * 0.17,
                    right: GetScreenSize.getScreenWidth(context) * 0.05,
                    child: const BagCustom())
              ],
            ),
          ),
        ),
        Expanded(
            child: Padding(
                padding: EdgeInsets.only(
                  top: GetScreenSize.getScreenWidth(context) * 0.05,
                ),
                child: SingleChildScrollView(
                    child: Column(children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: GetScreenSize.getScreenWidth(context) * 0.05,
                      right: GetScreenSize.getScreenWidth(context) * 0.05,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.object.category,
                          style: TextStyle(
                            fontSize:
                                GetScreenSize.getScreenWidth(context) * 0.04,
                            color: AppColors.appGreyText,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              right:
                                  GetScreenSize.getScreenWidth(context) * 0.07),
                          child: Text(
                            AppStrings.price,
                            style: TextStyle(
                              fontSize:
                                  GetScreenSize.getScreenWidth(context) * 0.04,
                              color: AppColors.appGreyText,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(
                        left: GetScreenSize.getScreenWidth(context) * 0.05,
                        right: GetScreenSize.getScreenWidth(context) * 0.05,
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.object.name,
                              style: TextStyle(
                                  fontSize:
                                      GetScreenSize.getScreenWidth(context) *
                                          0.055,
                                  color: AppColors.appBlackText,
                                  fontWeight: FontWeight.w600),
                            ),
                            Padding(
                                padding: EdgeInsets.only(
                                    right:
                                        GetScreenSize.getScreenWidth(context) *
                                            0.05),
                                child: Text(
                                  '\$ ${widget.object.price}',
                                  style: TextStyle(
                                      fontSize: GetScreenSize.getScreenWidth(
                                              context) *
                                          0.055,
                                      color: AppColors.appBlackText,
                                      fontWeight: FontWeight.w600),
                                ))
                          ])),
                  SizedBox(
                    height: GetScreenSize.getScreenWidth(context) * 0.25,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.object.imageLink.length,
                      itemBuilder: (context, index) {
                        final isSelected = index ==
                            context
                                .watch<ProductDetailsProvider>()
                                .getSelectedIndex;
                        return GestureDetector(
                            onTap: () {
                              context.read<ProductDetailsProvider>().setImage(
                                    widget.object.imageLink[index],
                                    index,
                                  );
                            },
                            child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: isSelected
                                            ? AppColors.orangestar
                                            : Colors.transparent,
                                        width: isSelected ? 2 : 0,
                                      ),
                                    ),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: SizedBox(
                                            height: MediaQuery.of(context)
                                                .size
                                                .height,
                                            width: GetScreenSize.getScreenWidth(
                                                    context) *
                                                0.2,
                                            child: CachedNetworkImage(
                                              imageUrl: widget
                                                  .object.imageLink[index],
                                              placeholder: (context, url) =>
                                                  Shimmer.fromColors(
                                                baseColor: Colors.grey[300]!,
                                                highlightColor:
                                                    Colors.grey[100]!,
                                                child: Container(
                                                  color: Colors
                                                      .white, // You can set any background color here
                                                ),
                                              ),
                                              fit: BoxFit.cover,
                                            ))))));
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: GetScreenSize.getScreenWidth(context) * 0.05,
                      right: GetScreenSize.getScreenWidth(context) * 0.05,
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            AppStrings.size,
                            style: TextStyle(
                                fontSize:
                                    GetScreenSize.getScreenWidth(context) *
                                        0.055,
                                color: AppColors.appBlackText,
                                fontWeight: FontWeight.w600),
                          ),
                          Padding(
                              padding: EdgeInsets.only(
                                  right: GetScreenSize.getScreenWidth(context) *
                                      0.05),
                              child: Text(
                                AppStrings.sizeGuide,
                                style: TextStyle(
                                    fontSize:
                                        GetScreenSize.getScreenWidth(context) *
                                            0.05,
                                    color: AppColors.appGreyText,
                                    fontWeight: FontWeight.w400),
                              ))
                        ]),
                  ),
                  SizedBox(
                    height: GetScreenSize.getScreenWidth(context) * 0.23,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: AppConstants.sizes.length,
                        itemBuilder: (context, index) {
                          final isSelected = index ==
                              context
                                  .watch<ProductDetailsProvider>()
                                  .getSizeIndex;
                          return GestureDetector(
                              onTap: () {
                                context
                                    .read<ProductDetailsProvider>()
                                    .setSize(index);
                              },
                              child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                      decoration: BoxDecoration(
                                        color: AppColors.appGreyBackground,
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                          color: isSelected
                                              ? AppColors.orangestar
                                              : Colors.transparent,
                                          width: isSelected ? 2 : 0,
                                        ),
                                      ),
                                      height:
                                          MediaQuery.of(context).size.height,
                                      width: GetScreenSize.getScreenWidth(
                                              context) *
                                          0.2,
                                      child: Center(
                                          child: Text(AppConstants.sizes[index],
                                              style: TextStyle(
                                                color: AppColors.appBlackText,
                                                fontSize: GetScreenSize
                                                        .getScreenWidth(
                                                            context) *
                                                    0.05,
                                                fontWeight: FontWeight.w600,
                                              ))))));
                        }),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: GetScreenSize.getScreenWidth(context) * 0.05),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        AppStrings.description,
                        style: TextStyle(
                            fontSize:
                                GetScreenSize.getScreenWidth(context) * 0.055,
                            color: AppColors.appBlackText,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: GetScreenSize.getScreenWidth(context) * 0.05,
                        right: GetScreenSize.getScreenWidth(context) * 0.05),
                    child: ReadMoreText(
                      widget.object.description,
                      style: TextStyle(
                          color: AppColors.appGreyText,
                          fontSize:
                              GetScreenSize.getScreenWidth(context) * 0.04,
                          fontWeight: FontWeight.w400),
                      trimLines: 3,
                      textAlign: TextAlign.left,
                      trimMode: TrimMode.Line,
                      trimCollapsedText: 'Read More..',
                      trimExpandedText: '  Show Less',
                      moreStyle: TextStyle(
                          fontSize:
                              GetScreenSize.getScreenWidth(context) * 0.04,
                          color: AppColors.appBlackText,
                          fontWeight: FontWeight.bold),
                      lessStyle: TextStyle(
                          color: AppColors.appBlackText,
                          fontSize:
                              GetScreenSize.getScreenWidth(context) * 0.04,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(
                        top: GetScreenSize.getScreenWidth(context) * 0.05,
                        left: GetScreenSize.getScreenWidth(context) * 0.05,
                        right: GetScreenSize.getScreenWidth(context) * 0.05,
                      ),
                      child: Column(children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                AppStrings.reviews,
                                style: TextStyle(
                                    fontSize:
                                        GetScreenSize.getScreenWidth(context) *
                                            0.055,
                                    color: AppColors.appBlackText,
                                    fontWeight: FontWeight.w600),
                              ),
                              GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ReviewsPage(
                                                  list: widget.object.reviews,
                                                )));
                                  },
                                  child: Text(
                                    AppStrings.viewAll,
                                    style: TextStyle(
                                        fontSize: GetScreenSize.getScreenWidth(
                                                context) *
                                            0.045,
                                        color: AppColors.appGreyText,
                                        fontWeight: FontWeight.w400),
                                  ))
                            ]),
                        CustomReviewBar(
                            object: widget.object
                                .reviews[widget.object.reviews.length - 1]),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(children: [
                                Text(
                                  AppStrings.totalPrice,
                                  style: TextStyle(
                                      fontSize: GetScreenSize.getScreenWidth(
                                              context) *
                                          0.055,
                                      color: AppColors.appBlackText,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  AppStrings.vatSD,
                                  style: TextStyle(
                                      fontSize: GetScreenSize.getScreenWidth(
                                              context) *
                                          0.035,
                                      color: AppColors.appGreyText,
                                      fontWeight: FontWeight.w600),
                                )
                              ]),
                              Text(
                                '\$ ${widget.object.totalPrice}',
                                style: TextStyle(
                                    fontSize:
                                        GetScreenSize.getScreenWidth(context) *
                                            0.059,
                                    color: AppColors.appBlackText,
                                    fontWeight: FontWeight.w600),
                              )
                            ])
                      ])),
                  const SizedBox(height: 95),
                ]))))
      ]),
      bottomSheet: CustomBottomButton(
        onTab: () {
          CommonFunctions.showAddToCart(context);
          AddToCart.addToCart(widget.object.id, context);
        },
        text: AppStrings.addtoCart01,
      ),
    );
  }
}
