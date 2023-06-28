import 'package:flutter/material.dart';

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

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
        backgroundColor: categoryColor,
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {},
      ),
    );
  }
}
