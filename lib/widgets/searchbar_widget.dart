import 'package:e_commerence_store_ui/utils/app_colors.dart';
import 'package:flutter/material.dart';

import '../utils/media_query.dart';

class MySearchBar extends StatefulWidget {
  final double height;
  final double width1;
  final double searchTextFont;
  final double fieldTextFont;
  final double searchIconSize;

  const MySearchBar(
      {super.key,
      required this.height,
      required this.width1,
      required this.searchTextFont,
      required this.fieldTextFont,
      required this.searchIconSize});

  @override
  State<MySearchBar> createState() => _MySearchBarState();
}

class _MySearchBarState extends State<MySearchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width1,
      height: widget.height,
      decoration: BoxDecoration(
        color: AppColors.appGreyBackground,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: AppColors.appGreyBackground,
          width: 0,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(GetScreenSize.getScreenWidth(context) * 0.009),
        child: TextField(
          style: TextStyle(
              fontSize: widget.fieldTextFont), // Set font size for entered text
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.search,
              color: AppColors.appGreyText,
              size: widget.searchIconSize,
            ),
            hintText: 'Search...',
            hintStyle: TextStyle(
              fontSize: widget.searchTextFont,
              color: AppColors.appGreyText,
            ), // Set font size for hint text
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
