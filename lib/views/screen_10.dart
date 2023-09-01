import 'package:e_commerence_store_ui/utils/app_colors.dart';
import 'package:e_commerence_store_ui/utils/app_strings.dart';
import 'package:e_commerence_store_ui/utils/media_query.dart';
import 'package:e_commerence_store_ui/views/screen_11.dart';
import 'package:flutter/material.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';

import '../models/review_model.dart';
import '../widgets/back_custom_middle.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_reviewbar.dart';

class Screen10 extends StatelessWidget {
  final List<ReviewModel> list;
  const Screen10({required this.list, super.key});

  @override
  Widget build(BuildContext context) {
    int length = list.length;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
              top: GetScreenSize.getScreenWidth(context) * 0.17,
              left: GetScreenSize.getScreenWidth(context) * 0.05,
              right: GetScreenSize.getScreenWidth(context) * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BackCustomMiddle(),
                  Expanded(child: SizedBox()),
                  Text(
                    'Reviews',
                    style: TextStyle(
                        color: AppColors.appBlackText,
                        fontSize: GetScreenSize.getScreenWidth(context) * 0.060,
                        fontWeight: FontWeight.w600),
                  ),
                  Expanded(child: SizedBox()),
                ],
              ),
              SizedBox(
                height: GetScreenSize.getScreenWidth(context) * 0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '$length Reviews',
                        style: TextStyle(
                            fontSize:
                                GetScreenSize.getScreenWidth(context) * 0.045,
                            fontWeight: FontWeight.w500),
                      ),
                      Row(
                        children: [
                          Text('4.8'),
                          Container(
                            // color: Colors.blue,
                            width: GetScreenSize.getScreenWidth(context) * 0.2,
                            child: SmoothStarRating(
                              size:
                                  GetScreenSize.getScreenWidth(context) * 0.04,
                              starCount: 5,
                              rating: 3.5,
                              color: AppColors.orangestar,
                              borderColor: AppColors.orangestar,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  CustomTextButton(
                    buttonColor: AppColors.reviewButton,
                    buttonText: AppStrings.addReviewButton,
                    fontSize: GetScreenSize.getScreenWidth(context) * 0.04,
                    onTab: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Screen11()));
                    },
                    radius: 10,
                    addIcon: true,
                    width: GetScreenSize.getScreenWidth(context) * 0.4,
                    icon: Icon(Icons.edit),
                    height: 50,
                    padding: EdgeInsets.all(0),
                  )
                ],
              ),
              SizedBox(
                  height: MediaQuery.of(context).size.height - 100,
                  child: ListView.separated(
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      return CustomReviewBar(object: list[index]);
                    },
                    separatorBuilder: (context, index) {
                      return Divider();
                    },
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
