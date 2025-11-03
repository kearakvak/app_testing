import 'package:app_tesing/models/food.dart';
import 'package:flutter/material.dart';

class MyTabBar extends StatelessWidget {
  final TabController tabController;
  const MyTabBar({super.key, required this.tabController});

  // List<Tab> _buildCategoryTabs() {
  //   final firstCategory = FoodCategory.values.first; // get only the first enum
  //   return [Tab(text: firstCategory.toString().split('.').last)];
  //   // return FoodCategory.values.map((category) {
  //   //   return Tab(
  //   //     text: category.toString().split('.').last,
  //   //   );
  //   // }).toList();
  // }
  // List<Tab> _buildCategoryTabs() {
  //   return FoodCategory.values.map((category) {
  //     return Tab(text: category.toString().split('.').last);
  //   }).toList();
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TabBar(
        controller: tabController,
        tabs: [Tab(text: FoodCate.values.first.toString().split('.').last)],
      ),
    );
  }
}
