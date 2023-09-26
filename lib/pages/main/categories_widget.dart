import 'package:flutter/material.dart';
import 'package:news_demo/entities/entities.dart';
import 'package:news_demo/utils/utils.dart';
import 'package:news_demo/values/values.dart';
import 'package:news_demo/widgets/custom_skeleton.dart';

/// 分类导航
Widget newsCategoriesWidget({
  List<CategoryResponseEntity>? categories,
  String? selCategoryCode,
  required Function(CategoryResponseEntity) onTap,
}) {
  if(categories == null || categories.isEmpty){
    return CustomListSkeleton();
  }
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: categories.map<Widget>((item) {
        return Container(
          alignment: Alignment.center,
          height: duSetHeight(52),
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: GestureDetector(
            child: Text(
              item.title ?? '',
              style: TextStyle(
                color: selCategoryCode == item.code
                    ? AppColors.secondaryElementText
                    : AppColors.primaryText,
                fontSize: duSetFontSize(18),
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
              ),
            ),
            onTap: () => onTap(item),
          ),
        );
      }).toList(),
    ),
  );
}
