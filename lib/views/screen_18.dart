// ignore_for_file: must_be_immutable

import 'package:e_commerence_store_ui/utils/app_strings.dart';
import 'package:e_commerence_store_ui/utils/media_query.dart';
import 'package:e_commerence_store_ui/views/screen_9.dart';
import 'package:e_commerence_store_ui/widgets/brand_custom_widget.dart';
import 'package:flutter/material.dart';

import '../models/brand_model.dart';
import '../models/products_model.dart';
import '../utils/app_colors.dart';
import '../utils/app_constants.dart';
import '../widgets/bag_custom.dart';
import '../widgets/product_widget.dart';

class Screen18 extends StatefulWidget {
  final BrandModel object;
  List<ProductsModel> list = [];
  Screen18({required this.object, super.key});

  @override
  State<Screen18> createState() => _Screen18State();
}

class _Screen18State extends State<Screen18> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.object.name == 'Adidas') {
      setState(() {
        widget.list = AppConstants.adidasList;
      });
    } else if (widget.object.name == 'Nike') {
      setState(() {
        widget.list = AppConstants.nikeList;
      });
    } else if (widget.object.name == 'Fila') {
      setState(() {
        widget.list = AppConstants.filaList;
      });
    } else {
      setState(() {
        widget.list = AppConstants.getDataList;
      });
    }
    print(widget.object.name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: GetScreenSize.getScreenWidth(context) * 0.17,
            left: GetScreenSize.getScreenWidth(context) * 0.05,
            right: GetScreenSize.getScreenWidth(context) * 0.05,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.arrow_back),
                    ),
                  ),
                  const Spacer(),
                  BrandWiget(object: widget.object),
                  const Spacer(),
                  const BagCustom(),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.items,
                        style: TextStyle(
                            color: AppColors.appBlackText,
                            fontSize:
                                GetScreenSize.getScreenWidth(context) * 0.05,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        AppStrings.avaliable,
                        style: TextStyle(
                            color: AppColors.appGreyText,
                            fontSize:
                                GetScreenSize.getScreenWidth(context) * 0.04,
                            fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: AppColors.appGreyBackground,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10))),
                    child: Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.sort,
                            color: AppColors.appBlackText,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            AppStrings.sort,
                            style: TextStyle(
                                color: AppColors.appBlackText,
                                fontWeight: FontWeight.w400,
                                fontSize:
                                    GetScreenSize.getScreenWidth(context) *
                                        0.04),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              GridView.builder(
                  // padding: EdgeInsets.all(screenSize * 0.17),
                  itemCount: widget.list.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.67,
                      crossAxisSpacing:
                          GetScreenSize.getScreenWidth(context) * 0.04,
                      mainAxisSpacing:
                          GetScreenSize.getScreenWidth(context) * 0.04),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    Screen9(object: widget.list[index])));
                      },
                      child: ProductWidget(
                        object: widget.list[index],
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
