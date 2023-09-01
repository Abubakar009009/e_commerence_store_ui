import 'package:e_commerence_store_ui/models/review_model.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';

import '../utils/app_colors.dart';
import '../utils/media_query.dart';

class CustomReviewBar extends StatefulWidget {
  final ReviewModel object;
  const CustomReviewBar({required this.object, super.key});

  @override
  State<CustomReviewBar> createState() => _CustomReviewBarState();
}

class _CustomReviewBarState extends State<CustomReviewBar> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: CircleAvatar(
            backgroundImage: AssetImage(widget.object.imageLink),
          ),
          title: Text(
            widget.object.name,
            style: TextStyle(
                fontSize: GetScreenSize.getScreenWidth(context) * 0.045,
                color: AppColors.appBlackText,
                fontWeight: FontWeight.w500),
            textScaleFactor: 1,
          ),
          trailing: Column(
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: widget.object.ratingValue,
                      style: TextStyle(
                        color: AppColors.appBlackText,
                        fontWeight: FontWeight.w500,
                        fontSize: GetScreenSize.getScreenWidth(context) * 0.04,
                      ),
                    ),
                    TextSpan(
                      text: '   rating',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: GetScreenSize.getScreenWidth(context) * 0.04,
                        color: AppColors.appGreyText,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                // color: Colors.blue,
                width: GetScreenSize.getScreenWidth(context) * 0.2,
                child: SmoothStarRating(
                  size: GetScreenSize.getScreenWidth(context) * 0.03,
                  starCount: 5,
                  rating: 3.5,
                  color: AppColors.orangestar,
                  borderColor: AppColors.orangestar,
                ),
              ),
            ],
          ),
          subtitle: Text(
            widget.object.date,
            style: TextStyle(
                fontSize: GetScreenSize.getScreenWidth(context) * 0.040,
                color: AppColors.appBlackText,
                fontWeight: FontWeight.w400),
          ),
          selected: true,
        ),
        ReadMoreText(
          widget.object.reviewText,
          style: TextStyle(
              color: AppColors.appGreyText,
              fontSize: GetScreenSize.getScreenWidth(context) * 0.04,
              fontWeight: FontWeight.w400),
          trimLines: 3,
          textAlign: TextAlign.left,
          trimMode: TrimMode.Line,
          trimCollapsedText: 'Read More..',
          trimExpandedText: '  Show Less',
          moreStyle: TextStyle(
              fontSize: GetScreenSize.getScreenWidth(context) * 0.04,
              color: AppColors.appBlackText,
              fontWeight: FontWeight.bold),
          lessStyle: TextStyle(
              color: AppColors.appBlackText,
              fontSize: GetScreenSize.getScreenWidth(context) * 0.04,
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
