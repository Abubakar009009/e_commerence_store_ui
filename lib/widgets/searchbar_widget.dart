// import 'package:e_commerence_store_ui/utils/app_colors.dart';
// import 'package:flutter/material.dart';

// import '../utils/media_query.dart';

// class MySearchBar extends StatefulWidget {
//   final double height;
//   final double width1;
//   final double searchTextFont;
//   final double fieldTextFont;
//   final double searchIconSize;

//   const MySearchBar(
//       {super.key,
//       required this.height,
//       required this.width1,
//       required this.searchTextFont,
//       required this.fieldTextFont,
//       required this.searchIconSize});

//   @override
//   State<MySearchBar> createState() => _MySearchBarState();
// }

// class _MySearchBarState extends State<MySearchBar> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: widget.width1,
//       height: widget.height,
//       decoration: BoxDecoration(
//         color: AppColors.appGreyBackground,
//         borderRadius: BorderRadius.circular(10),
//         border: Border.all(
//           color: AppColors.appGreyBackground,
//           width: 0,
//         ),
//       ),
//       child: Padding(
//         padding: EdgeInsets.all(GetScreenSize.getScreenWidth(context) * 0.009),
//         child: TextField(
//           style: TextStyle(
//               fontSize: widget.fieldTextFont), // Set font size for entered text
//           decoration: InputDecoration(
//             prefixIcon: Icon(
//               Icons.search,
//               color: AppColors.appGreyText,
//               size: widget.searchIconSize,
//             ),
//             hintText: 'Search...',
//             hintStyle: TextStyle(
//               fontSize: widget.searchTextFont,
//               color: AppColors.appGreyText,
//             ), // Set font size for hint text
//             border: InputBorder.none,
//           ),
//         ),
//       ),
//     );
//   }
// }

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
  bool _showBrandList = false;
  List<String> _brands = [
    'Nike',
    'Adidas',
    'Puma',
    'Reebok',
    'Under Armour',
    'New Balance',
    'Converse',
    'Vans',
    'Fila',
    'Skechers',
  ];

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
        child: Stack(
          children: [
            TextField(
              onTap: () {
                // Show the brand list when the search bar is tapped
                setState(() {
                  _showBrandList = true;
                });
              },
              style: TextStyle(fontSize: widget.fieldTextFont),
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
                ),
                border: InputBorder.none,
              ),
            ),
            if (_showBrandList)
              Container(
                margin: EdgeInsets.only(top: widget.height),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 4,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: ListView.builder(
                  itemCount: _brands.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(_brands[index]),
                      onTap: () {
                        // Perform an action when a brand is selected, e.g., print the selected brand
                        print('Selected Brand: ${_brands[index]}');
                        setState(() {
                          _showBrandList = false; // Hide the brand list
                        });
                      },
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
