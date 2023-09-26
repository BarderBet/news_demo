import 'package:flutter/material.dart';
import 'package:loader_skeleton/loader_skeleton.dart';

class CustomSkeleton extends StatefulWidget {
  const CustomSkeleton({super.key});

  @override
  State<CustomSkeleton> createState() => _CustomSkeletonState();
}

class _CustomSkeletonState extends State<CustomSkeleton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    animation = Tween<double>(begin: -1.0, end: 2.0).animate(
        CurvedAnimation(curve: Curves.easeInOutQuad, parent: _controller));

    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed ||
          status == AnimationStatus.dismissed) {
        _controller.repeat();
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Container(
          height: width * 0.13,
          child: Padding(
            padding: const EdgeInsets.all(0),
            child: Container(
              padding: EdgeInsets.all(16),
              child: Container(
                height: width * 0.13,
                width: width * 0.13,
                decoration: myBoxDec(animation, isCircle: true),
              ),
            ),
          ),
        );
      },
    );
  }
}

class CustomListSkeleton extends StatelessWidget {
  final int itemCount;

  CustomListSkeleton({this.itemCount = 5});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: itemCount,
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        return const CustomSkeleton();
      },
    );
  }
}
