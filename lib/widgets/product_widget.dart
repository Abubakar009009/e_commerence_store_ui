import 'package:e_commerence_store_ui/models/products_model.dart';
import 'package:e_commerence_store_ui/utils/app_colors.dart';
import 'package:e_commerence_store_ui/utils/media_query.dart';
import 'package:flutter/material.dart';

class ProductWidget extends StatelessWidget {
  final ProductsModel object;
  const ProductWidget({required this.object, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: GetScreenSize.getScreenWidth(context) * 0.39,
            width: GetScreenSize.getScreenWidth(context) * 0.45,
            child: Stack(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      object.imageLink[0],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  right: 8,
                  top: 8,
                  child: Icon(
                    Icons.favorite,
                    color: AppColors.appGreyText,
                  ),
                )
              ],
            ),
          ),
          Text(
            object.category,
            maxLines: 2,
            style: TextStyle(
                overflow: TextOverflow.ellipsis,
                fontSize: GetScreenSize.getScreenWidth(context) * 0.04,
                color: AppColors.appBlackText,
                fontWeight: FontWeight.w500),
          ),
          Text(
            object.name,
            style: TextStyle(
                fontSize: GetScreenSize.getScreenWidth(context) * 0.04,
                color: AppColors.appBlackText,
                fontWeight: FontWeight.w500),
          ),
          Text(
            object.price,
            style: TextStyle(
                fontSize: GetScreenSize.getScreenWidth(context) * 0.04,
                color: AppColors.appBlackText,
                fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
