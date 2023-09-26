import 'package:flutter/material.dart';
import 'package:news_demo/widgets/skeleton.dart';

void main() => runApp(
      const MaterialApp(
        debugShowCheckedModeBanner: false,
        color: Colors.white,
        home: TestPage(),
      ),
    );

class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Colors.white,
            height: 200,
            child: horizontalListSkeleton(),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
