import 'package:e_commerence_store_ui/models/brand_model.dart';
import 'package:e_commerence_store_ui/utils/app_colors.dart';
import 'package:e_commerence_store_ui/utils/media_query.dart';
import 'package:flutter/material.dart';

class BrandWiget extends StatelessWidget {
  final BrandModel object;
  const BrandWiget({required this.object, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(left: GetScreenSize.getScreenWidth(context) * 0.04),
      child: Container(
        height: GetScreenSize.getScreenWidth(context) * 0.14,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.appGreyBackground),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 5.0, right: 5),
              child: Container(
                  height: GetScreenSize.getScreenWidth(context) * 0.1,
                  width: GetScreenSize.getScreenWidth(context) * 0.1,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.AppWhiteColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Image.network(object.imageLink),
                  )),
            ),
            Padding(
              padding: EdgeInsets.only(
                  right: GetScreenSize.getScreenWidth(context) * 0.03,
                  left: GetScreenSize.getScreenWidth(context) * 0.02),
              child: Text(
                object.name,
                style: TextStyle(
                    fontSize: GetScreenSize.getScreenWidth(context) * 0.04,
                    fontWeight: FontWeight.w500),
              ),
            )
          ],
        ),
      ),
    );
  }
}
