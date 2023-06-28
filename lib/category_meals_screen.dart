import 'package:flutter/material.dart';

import 'dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  // final String cattegoryId;
  // final String categoryTitle;

  // const CategoryMealsScreen(this.cattegoryId, this.categoryTitle, {super.key});

  static const routeName = '/category-meals';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final categoryColor = routeArgs['color'];

    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
        backgroundColor: categoryColor,
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return Text(categoryMeals[index].title);
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
