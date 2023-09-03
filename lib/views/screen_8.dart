import 'package:e_commerence_store_ui/utils/app_assets.dart';
import 'package:e_commerence_store_ui/utils/app_colors.dart';
import 'package:e_commerence_store_ui/utils/app_constants.dart';
import 'package:e_commerence_store_ui/utils/app_strings.dart';
import 'package:e_commerence_store_ui/views/screen_17_drawer.dart';
import 'package:e_commerence_store_ui/views/screen_18.dart';
import 'package:e_commerence_store_ui/views/screen_9.dart';
import 'package:e_commerence_store_ui/widgets/bag_custom.dart';
import 'package:flutter/material.dart';

import '../utils/media_query.dart';
import '../widgets/brand_custom_widget.dart';
import '../widgets/product_widget.dart';
import '../widgets/searchbar_widget.dart';

class Screen8 extends StatelessWidget {
  const Screen8({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _scaffoldKey,
      drawer: const Screen17Drawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: GetScreenSize.getScreenWidth(context) * 0.15,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.05,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        _scaffoldKey.currentState?.openDrawer();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.AppWhiteColor,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(AppAssets.menu),
                        ),
                      ),
                    ),
                    //  MenuCustom()
                    const BagCustom()
                  ],
                ),
              ),
              SizedBox(
                height: GetScreenSize.getScreenWidth(context) * 0.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.05,
                ),
                child: Text(
                  AppStrings.hello,
                  style: TextStyle(
                      fontSize: GetScreenSize.getScreenWidth(context) * 0.10,
                      color: AppColors.appBlackText,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.05,
                ),
                child: Text(
                  AppStrings.wellcome,
                  style: TextStyle(
                      fontSize: GetScreenSize.getScreenWidth(context) * 0.04,
                      color: AppColors.appGreyText,
                      fontWeight: FontWeight.w400),
                ),
              ),
              SizedBox(
                height: GetScreenSize.getScreenWidth(context) * 0.05,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.05,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MySearchBar(
                      fieldTextFont:
                          GetScreenSize.getScreenWidth(context) * 0.04,
                      height: GetScreenSize.getScreenWidth(context) * 0.14,
                      searchIconSize:
                          GetScreenSize.getScreenWidth(context) * 0.08,
                      searchTextFont:
                          GetScreenSize.getScreenWidth(context) * 0.05,
                      width1: GetScreenSize.getScreenWidth(context) * 0.7,
                    ),
                    Container(
                      height: GetScreenSize.getScreenWidth(context) * 0.13,
                      width: GetScreenSize.getScreenWidth(context) * 0.13,
                      decoration: BoxDecoration(
                        color: AppColors.appPurpleColor,
                        borderRadius: BorderRadius.circular(
                            10), // Half of the width/height for a perfect circle
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(AppAssets.microphone),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: GetScreenSize.getScreenWidth(context) * 0.07,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.05,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppStrings.brand,
                      style: TextStyle(
                          color: AppColors.appBlackText,
                          fontSize:
                              GetScreenSize.getScreenWidth(context) * 0.06,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      AppStrings.viewAll,
                      style: TextStyle(
                          color: AppColors.appGreyText,
                          fontSize:
                              GetScreenSize.getScreenWidth(context) * 0.04,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: GetScreenSize.getScreenWidth(context) * 0.05,
              ),
              SizedBox(
                height: GetScreenSize.getScreenWidth(context) * 0.14,
                child: NotificationListener<OverscrollIndicatorNotification>(
                  onNotification: (overscroll) {
                    overscroll.disallowIndicator();
                    return true;
                  },
                  child: ListView.builder(
                    physics: const ClampingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: AppConstants.brandList.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => Screen18(
                                        object: AppConstants.brandList[index],
                                      ))));
                        },
                        child: BrandWiget(
                          object: AppConstants.brandList[index],
                        ),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(
                height: GetScreenSize.getScreenWidth(context) * 0.07,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.05,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppStrings.newArrivals,
                      style: TextStyle(
                          fontSize:
                              GetScreenSize.getScreenWidth(context) * 0.06,
                          color: AppColors.appBlackText,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      AppStrings.viewAll,
                      style: TextStyle(
                          color: AppColors.appGreyText,
                          fontSize:
                              GetScreenSize.getScreenWidth(context) * 0.04,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.05,
                ),
                child: GridView.builder(
                    // padding: EdgeInsets.all(screenSize * 0.17),
                    itemCount: AppConstants.productsList.length,
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
                                  builder: (context) => Screen9(
                                      object:
                                          AppConstants.productsList[index])));
                        },
                        child: ProductWidget(
                          object: AppConstants.productsList[index],
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
