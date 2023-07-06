import 'package:flutter/material.dart';

import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';

  const MealDetailScreen({super.key});

  Widget sectionTitle(String title, BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
        width: double.infinity,
        padding: EdgeInsets.all(10),
        height: 250,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(15)),
        margin: EdgeInsets.all(15),
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    final mealId = routeArgs['id'];
    final color = routeArgs['color'];

    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);

    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedMeal.title}'),
        backgroundColor: color,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 250,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            sectionTitle('Ingredients', context),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(15)),
              margin: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (int i = 0; i < selectedMeal.ingredients.length; i++)
                    Card(
                      elevation: 0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        child: Text(
                          selectedMeal.ingredients[i],
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                ],
              ),
            ),
            // buildContainer(ListView.builder(
            //   itemBuilder: (ctx, index) => Card(
            //     color: Theme.of(context).colorScheme.secondary,
            //     child: Padding(
            //       padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            //       child: Text(selectedMeal.ingredients[index]),
            //     ),
            //   ),
            //   itemCount: selectedMeal.ingredients.length,
            // )),
            sectionTitle('Steps', context),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(15)),
              margin: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (int j = 0; j < selectedMeal.steps.length; j++)
                    Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              child: Text('# ${j + 1}'),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Flexible(
                                child: Text(
                              selectedMeal.steps[j],
                              style: const TextStyle(height: 1.5),
                            )),
                          ],
                        ),
                        if (j != selectedMeal.steps.length - 1)
                          const Divider(
                            color: Colors.grey,
                          )
                      ],
                    )
                ],
              ),
            )
            // buildContainer(ListView.builder(
            //   itemBuilder: (ctx, index) => Column(
            //     children: [
            //       ListTile(
            //         leading: CircleAvatar(
            //           child: Text('# ${index + 1}'),
            //         ),
            //         title: Text(selectedMeal.steps[index]),
            //       ),
            //       Divider(
            //         color: Colors.grey,
            //       )
            //     ],
            //   ),
            //   itemCount: selectedMeal.steps.length,
            // ),
            // )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pop(mealId);
        },
        child: Icon(Icons.delete_rounded),
      ),
    );
  }
}
