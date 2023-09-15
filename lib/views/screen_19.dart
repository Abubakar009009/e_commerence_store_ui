import 'package:e_commerence_store_ui/utils/app_constants.dart';
import 'package:e_commerence_store_ui/utils/app_strings.dart';
import 'package:e_commerence_store_ui/views/screen_9.dart';
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/media_query.dart';
import '../widgets/product_widget.dart';

class Screen19 extends StatefulWidget {
  const Screen19({super.key});

  @override
  State<Screen19> createState() => _Screen19State();
}

class _Screen19State extends State<Screen19> {
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
                  Spacer(),
                  Text(
                    'Wishlist',
                    style: TextStyle(
                        color: AppColors.appBlackText,
                        fontSize: GetScreenSize.getScreenWidth(context) * 0.055,
                        fontWeight: FontWeight.w600),
                  ),
                  Spacer(),
                ],
              ),
              SizedBox(
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
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.edit_location_alt_outlined,
                            color: AppColors.appBlackText,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            AppStrings.edit,
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
                  itemCount: AppConstants.wishlistProducts.length,
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
                                        AppConstants.wishlistProducts[index])));
                      },
                      child: ProductWidget(
                        object: AppConstants.getDataList[index],
                        heartColor: Colors.black.withOpacity(0.7),
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
