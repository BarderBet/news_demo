import 'package:flutter/material.dart';
import 'package:news_demo/entities/entities.dart';
import 'package:news_demo/utils/utils.dart';
import 'package:news_demo/values/values.dart';
import 'package:news_demo/widgets/widgets.dart';

/// 频道导航
Widget newsChannelsWidget({
  List<ChannelResponseEntity>? channels,
  required Function(ChannelResponseEntity) onTap,
}) {
  if(channels == null || channels.isEmpty){
    return horizontalListSkeleton();
  }
  return Container(
    height: duSetHeight(137),
    child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: channels.map<Widget>((item) {
          return Container(
            width: duSetWidth(70),
            height: duSetHeight(97),
            margin: EdgeInsets.symmetric(horizontal: duSetWidth(10)),
            child: InkWell(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // 图标
                  Container(
                    height: duSetWidth(64),
                    margin: EdgeInsets.symmetric(horizontal: duSetWidth(3)),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Positioned(
                          left: 0,
                          top: 0,
                          right: 0,
                          child: Container(
                            height: duSetWidth(64),
                            decoration: const BoxDecoration(
                              color: AppColors.primaryBackground,
                              boxShadow: [
                                Shadows.primaryShadow,
                              ],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(32)),
                            ),
                            child: Container(),
                          ),
                        ),
                        Positioned(
                          left: duSetWidth(10),
                          top: duSetWidth(10),
                          right: duSetWidth(10),
                          child: Image.asset(
                            "assets/images/channel-${item.code}.png",
                            fit: BoxFit.none,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // 标题
                  Text(
                    item.title??'',
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.clip,
                    maxLines: 1,
                    style: TextStyle(
                      color: AppColors.thirdElementText,
                      fontFamily: "Avenir",
                      fontWeight: FontWeight.w400,
                      fontSize: duSetFontSize(14),
                      height: 1,
                    ),
                  ),
                ],
              ),
              onTap: () => onTap!(item),
            ),
          );
        }).toList(),
      ),
    ),
  );
}
