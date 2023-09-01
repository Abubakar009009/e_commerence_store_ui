import 'package:e_commerence_store_ui/models/products_model.dart';
import 'package:e_commerence_store_ui/providers/product_details_provider.dart';
import 'package:e_commerence_store_ui/utils/app_colors.dart';
import 'package:e_commerence_store_ui/utils/app_constants.dart';
import 'package:e_commerence_store_ui/utils/app_strings.dart';
import 'package:e_commerence_store_ui/utils/media_query.dart';
import 'package:e_commerence_store_ui/views/screen_10.dart';
import 'package:e_commerence_store_ui/widgets/back_custom.dart';
import 'package:e_commerence_store_ui/widgets/bag_custom.dart';
import 'package:e_commerence_store_ui/widgets/custom_reviewbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';

import '../widgets/custom_bottom_buttons.dart';

class Screen9 extends StatefulWidget {
  final ProductsModel object;
  const Screen9({required this.object, super.key});

  @override
  State<Screen9> createState() => _Screen9State();
}

class _Screen9State extends State<Screen9> {
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
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: GetScreenSize.getScreenWidth(context) * 1,
              width: GetScreenSize.getScreenWidth(context) * 1,
              child: Stack(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset(
                      context.watch<ProductDetailsProvider>().getImage,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                      top: GetScreenSize.getScreenWidth(context) * 0.17,
                      child: BackCustom()),
                  Positioned(
                      top: GetScreenSize.getScreenWidth(context) * 0.17,
                      right: GetScreenSize.getScreenWidth(context) * 0.05,
                      child: BagCustom())
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: GetScreenSize.getScreenWidth(context) * 0.05,
              ),
              child: Column(
                children: [
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
                                  GetScreenSize.getScreenWidth(context) * 0.055,
                              color: AppColors.appBlackText,
                              fontWeight: FontWeight.w600),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              right:
                                  GetScreenSize.getScreenWidth(context) * 0.05),
                          child: Text(
                            widget.object.price,
                            style: TextStyle(
                                fontSize:
                                    GetScreenSize.getScreenWidth(context) *
                                        0.055,
                                color: AppColors.appBlackText,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                  ),
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
                                  height: MediaQuery.of(context).size.height,
                                  width: GetScreenSize.getScreenWidth(context) *
                                      0.2,
                                  child: Image.asset(
                                    widget.object.imageLink[index],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
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
                                  GetScreenSize.getScreenWidth(context) * 0.055,
                              color: AppColors.appBlackText,
                              fontWeight: FontWeight.w600),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              right:
                                  GetScreenSize.getScreenWidth(context) * 0.05),
                          child: Text(
                            AppStrings.sizeGuide,
                            style: TextStyle(
                                fontSize:
                                    GetScreenSize.getScreenWidth(context) *
                                        0.05,
                                color: AppColors.appGreyText,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ],
                    ),
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
                              height: MediaQuery.of(context).size.height,
                              width:
                                  GetScreenSize.getScreenWidth(context) * 0.2,
                              child: Center(
                                child: Text(
                                  AppConstants.sizes[index],
                                  style: TextStyle(
                                    color: AppColors.appBlackText,
                                    fontSize:
                                        GetScreenSize.getScreenWidth(context) *
                                            0.05,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
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
                    child: Column(
                      children: [
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
                            Text(
                              AppStrings.viewAll,
                              style: TextStyle(
                                  fontSize:
                                      GetScreenSize.getScreenWidth(context) *
                                          0.045,
                                  color: AppColors.appGreyText,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        CustomReviewBar(
                            object: widget.object
                                .reviews[widget.object.reviews.length - 1]),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
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
                                ),
                              ],
                            ),
                            Text(
                              widget.object.totalPrice,
                              style: TextStyle(
                                  fontSize:
                                      GetScreenSize.getScreenWidth(context) *
                                          0.055,
                                  color: AppColors.appBlackText,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 85),
                ],
              ),
            )
          ],
        ),
      ),
      bottomSheet: CustomButtomButton(
        onTab: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Screen10(
                        list: widget.object.reviews,
                      )));
        },
        text: AppStrings.addtoCart01,
      ),
    );
  }
}
