import 'package:app_tesing/components/my_current_location.dart';
import 'package:app_tesing/components/my_description_box.dart';
import 'package:app_tesing/components/my_drawer.dart';
import 'package:app_tesing/components/my_food_tile.dart';
import 'package:app_tesing/components/my_sliver_app_bar.dart';
import 'package:app_tesing/components/my_tab_bar.dart';
import 'package:app_tesing/models/food.dart';
import 'package:app_tesing/models/restaurant.dart';
import 'package:app_tesing/pages/detail_food.dart';
import 'package:app_tesing/pages/food_page.dart';
import 'package:app_tesing/services/navigation_service.dart';
import 'package:app_tesing/services/request_data_holding.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  // tab controller
  final context = NavigationService.context();
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(
      // length: FoodCategory.values.length,
      length: FoodCate.values.length,
      vsync: this,
    );
    // ✅ Fetch data once when page starts
    Future.microtask(() {
      final requestData = context.read<RequestDataHolding>();
      requestData.getRecipes();
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tabController.dispose();
    super.dispose();
  }

  // // sort out and return a list of food items that belong to a specific category
  // List<Food> _filterMenuByCategory(FoodCategory category, List<Food> fullMenu) {
  //   return fullMenu.where((food) => food.category == category).toList();
  // }

  // // return list of foods in given category
  // List<Widget> getFoodInThisCategory(List<Food> fullMenu) {
  //   final requestData = context.watch<RequestDataHolding>();
  //   return FoodCategory.values.map((category) {
  //     // get category menu
  //     List<Food> categoryMenu = _filterMenuByCategory(category, fullMenu);

  //     return ListView.builder(
  //       itemCount: categoryMenu.length,
  //       physics: NeverScrollableScrollPhysics(),
  //       padding: EdgeInsets.zero,
  //       itemBuilder: (context, index) {
  //         // get individual food
  //         final food = categoryMenu[index];

  //         // return food tile UI
  //         // return FoodTile(
  //         //   food: requestData?.data?.recipes[index] ?? [],
  //         //   onTap: () => Navigator.push(
  //         //     context,
  //         //     MaterialPageRoute(builder: (context) => FoodPage(food: food)),
  //         //   ),
  //         // );
  //       },
  //     );
  //   }).toList();
  // }

  @override
  Widget build(BuildContext context) {
    final requestData = context.watch<RequestDataHolding>();

    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Home"),
      //   backgroundColor: Theme.of(context).colorScheme.background,
      // ),
      drawer: MyDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          MySliverAppBar(
            title: MyTabBar(tabController: _tabController),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Divider(
                  indent: 25,
                  endIndent: 25,
                  color: Theme.of(context).colorScheme.secondary,
                ),

                // my current location
                MyCurrentLocation(),

                // description box
                MyDescriptionBox(),
              ],
            ),
          ),
        ],
        body: RefreshIndicator(
          onRefresh: () async {
            requestData.clearData();
            await requestData.getRecipes();
          },
          child: Skeletonizer(
            enabled: requestData.isLoading || requestData.data == null,
            child: ListView.builder(
              itemCount:
                  requestData.data?.recipes.length ??
                  5, // show 5 skeletons if data is null
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                if (requestData.data?.recipes == null) {
                  // show skeleton tile
                  return Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            "--------------------------- ---------------------- --------------------- --------------------- --------------------------- ---------------------- --------------------- ---------------------",
                            maxLines: 5, // optional: limit number of lines
                            overflow: TextOverflow
                                .ellipsis, // optional: show "..." if text is too long
                          ),
                        ),
                        SizedBox(width: 10),
                        Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  final food = requestData.data!.recipes[index];
                  return FoodTile(
                    food: food,
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => DetailFood(
                          recipe: food,
                          // imageUrl: food.imageUrl, // Pass your food data
                          // title: food.name,
                          // description: food.description,
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ),

        //  Consumer<Restaurant>(
        //   builder: (context, restaurant, child) => TabBarView(
        //     controller: _tabController,
        //     children: getFoodInThisCategory(restaurant.menu),
        //   ),
        // ),
      ),
    );
  }
}
