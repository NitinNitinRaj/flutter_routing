import 'package:flutter/material.dart';
import 'package:flutter_routing/modules/meals.dart';
import '../utils/dummy_data.dart';

class MealInfo extends StatelessWidget {
  static const routeName = "/meal-info";
  final Function addFavoriteToggle;
  final Function isFavorited;
  const MealInfo(
      {super.key, required this.addFavoriteToggle, required this.isFavorited});

  @override
  Widget build(BuildContext context) {
    final String mealId = ModalRoute.of(context)!.settings.arguments as String;
    final Meal meal = dummyMeals.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image.network(
                meal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(context, "Ingredients"),
            buildListContainer(ListView.builder(
              itemCount: meal.ingredients.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Theme.of(context).colorScheme.secondary,
                  margin: const EdgeInsets.all(5),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(meal.ingredients[index]),
                  ),
                );
              },
            )),
            buildSectionTitle(context, "Steps"),
            buildListContainer(
              ListView.builder(
                itemCount: meal.steps.length,
                itemBuilder: (context, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text("#${index + 1}"),
                      ),
                      title: Text(meal.steps[index]),
                    ),
                    const Divider()
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => addFavoriteToggle(mealId),
        child: isFavorited(mealId)
            ? Icon(
                Icons.favorite,
                color: Theme.of(context).primaryColor,
              )
            : const Icon(Icons.favorite_border),
      ),
    );
  }

  Container buildListContainer(Widget child) {
    return Container(
      height: 200,
      width: 300,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }

  Container buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }
}
