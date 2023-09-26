import 'package:flutter/material.dart';
import 'package:loader_skeleton/loader_skeleton.dart';
import 'package:news_demo/widgets/custom_skeleton.dart';

/// 骨架屏-卡片
Widget cardListSkeleton() {
  return CardListSkeleton(
    isCircularImage: true,
    isBottomLinesActive: false,
    length: 10,
  );
}

/// 页面骨架屏
Widget pageSkeleton() {
  return CardPageSkeleton(
    totalLines: 5,
  );
}

Widget horizontalListSkeleton() {
  return CustomListSkeleton(
    itemCount: 10,
  );
}
